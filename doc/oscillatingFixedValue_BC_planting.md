# 移植OpenFOAM2.3.0 的oscillatingFixedValue 边界到OpenFOAM2106

@Author :Wenyu Chen

@Data:06-28-2022

步骤：

## 1.拷贝源代码

`OpenFOAM-2.3.0/src/finiteVolum/fields/fvPatchFields/derived/oscillatingFixedValue/* `拷贝到目录下：

`OpenFOAM-2.3.0/src/finiteVolum/fields/fvPatchFields/derived/`

手动鼠标操作或者

```shell
cp -r OpenFOAM-2.3.0/src/finiteVolum/fields/fvPatchFields/derived/oscillatingFixedValue/
OpenFOAM-2.3.0/src/finiteVolum/fields/fvPatchFields/derived/
```

该源文件包括如下文件：

```c++
oscillatingFixedValueFvPatchField.C
oscillatingFixedValueFvPatchField.H
oscillatingFixedValueFvPatchFields.C
oscillatingFixedValueFvPatchFields.H
oscillatingFixedValueFvPatchFieldsFwd.H
```

## 2.修改编译配置文件

2.3.0的编译路径和2106的编译路径有变化，需要修改2106的编译配置文件为

`$SRC/Make/files`

在其中添加：

```c++
$(derivedFvPatchFields)/oscillatingFixedValue/oscillatingFixedValueFvPatchFields.C
```

这是类比同样代码结构的 `acousticWaveTransmissive`，其结构为：

```c++
acousticWaveTransmissiveFvPatchField.C
acousticWaveTransmissiveFvPatchField.H
acousticWaveTransmissiveFvPatchFields.C
acousticWaveTransmissiveFvPatchFields.H
acousticWaveTransmissiveFvPatchFieldsFwd.H
```

这几个文件时编译成库时的主文件为

```c++
$(derivedFvPatchFields)/acousticWaveTransmissive/acousticWaveTransmissiveFvPatchFields.C
```

## 3.添加软链接文件到lnInclude/

没有仔细看编译的顺利我不确定是否会把新的源文件都在编译过程中生成软链接，因此手动生成以免后续编译求解器等可执行程序时候链接库的时候找不到头文件：

软链接的目录和步骤2中的`/Make`文件夹同级

```shell
cd ~/OpenFOAM/OpenFOAM-v2106/src/finiteVolume/lnInclude
ln -s ../fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValueFvPatchField.C oscillatingFixedValuePatchField.C
ln -s ../fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValueFvPatchField.H oscillatingFixedValuePatchField.H
#...同上将所有源文件和头文件都在lnInclude文件夹下生成软链接
```

## 4. 编译

在`Make`同级文件夹下编译，2106只需要输入wmake命令调用make

```shell
wmake
```

编译就会报bug，我的习惯是面向bug debug。

如果遇到如下这种bug

```shell
make: *** No rule to make target '/home/mollychen/OpenFOAM/OpenFOAM-v2106/build/linux64Gcc103DPInt32Opt/src/finiteVolume/fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValuePatchFields.C.dep', needed by '/home/mollychen/OpenFOAM/OpenFOAM-v2106/build/linux64Gcc103DPInt32Opt/src/finiteVolume/fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValuePatchFields.o'.  Stop
```

说明程序找不到源文件或依赖文件，我上面是写错了文件名，少了Fv，写对就好了。这个bug是人为的。细心的就可以避免。

还会有bug：

```shell
fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValueFvPatchField.H:89:10: fatal error: DataEntry.H: No such file or directory
 #include "DataEntry.H"
          ^~~~~~~~~~~~~
compilation terminated.
```

2106中该类被`Function1.H`替换,

## 5 修改源代码

在`$SRC/finiteVolume/fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValueFvPatchField.H`： 把 `DataEntry`类都替换为`Function1`类。

```c++
#include "Function1.H"   
		//- Amplitude
        autoPtr<Function1<scalar> > amplitude_;

        //- Frequency
        autoPtr<Function1<scalar> > frequency_;
```

在`$SRC/finiteVolume/fields/fvPatchFields/derived/oscillatingFixedValue/oscillatingFixedValueFvPatchField.C`

构造函数也替换一下：

```c++
template<class Type>
oscillatingFixedValueFvPatchField<Type>::oscillatingFixedValueFvPatchField
(
    const fvPatch& p,
    const DimensionedField<Type, volMesh>& iF,
    const dictionary& dict
)
:
    fixedValueFvPatchField<Type>(p, iF),
    refValue_("refValue", dict, p.size()),
    offset_(dict.lookupOrDefault<Type>("offset", pTraits<Type>::zero)),
    amplitude_(Function1<scalar>::New("amplitude", dict)),//-将EntryData 改为 Funciton1
    frequency_(Function1<scalar>::New("frequency", dict)),
    curTimeIndex_(-1)
```

修改完之后回到`Make/` 同级目录继续重复4步骤即可.

