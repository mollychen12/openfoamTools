# Tools of OF self-developed
This repo is consists of kinds of little codes that like modification of a bc of the openfoam original bc etc.Tools here provided are not contain complex solver and discreticition algorithm.
## 1 foamToComsol
/foamToComsol is an tool that has been tested at OpenFOAM2106.The codes refer to the applicaionts/utilities/postProcessing/dataConversion/foamDataToFluent/
wmake it can build it .then the exe name is foamToComsol；
 Your could place it at any path only if you have called the environment of OpenFoam.
 For example in my server, it make like this:

```
of 2106 # call the bashrc for the OpenFOAM 2106
cd your_path_any_way/foamToComsol/
wmake

```

foamToComsol can used to convert U p k omega files into the form that comsol interpolation funcion could recognize.

After the utilities are compiled done. You could use it at your case path, which usually include 0/ constant/ and system/.


## 2 oscillatingFixedValue
oscillatingFixedValue/
should be located in the src/finiteVolume/fields/fvPatchFields/derived/ pathand when build 
still have to add the line to finiteVolume/Make/files
`$(derivedFvPatchFields)/oscillatingFixedValue/oscillatingFixedValueFvPatchFields.C`
and then 'wmake libso' at the /Make same level path to change the libfiniteVolume.
The oscillatingFixedValue was initially appear on some history edition. Here the tools more like a version update for v2106 than a self-developed.

The oscillatingFixedValue coulde be used to add harmonic or other source at the boundary to the simulation domain. And fvOptions could also serve the identical function.


Hope you will have fun with those tools! Though we did not put GNU 2.0 license into this folds. But as it developed based OpenFOAM, we feel it is our obligation to make it open source. 

And feel free to contact me if you have some problems or any technique communications.

Email: 1223234393@qq.com


