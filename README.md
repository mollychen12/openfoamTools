# Tools of OF self-developed
This repo is consists of kinds of little code that like modify a bc of the openfoam original bc etc.Tools that not contain complex solver and discreticition algorithm.
## 1
/foamToComsol is an tool that has been tested at OpenFOAM2106.The code referencing the applicaionts/utilities/postProcessing/dataConversion/foamDataToFluent/
wmake it can build it .then the exe name is foamToComsol；
foamToComsol initialized to convert U p k omega files into the form that comsol interpolation funcion could recognize.

## 2
oscillatingFixedValue/
should be located in the src/finiteVolume/fields/fvPatchFields/derived/ pathand when build 
still have to add the line to finiteVolume/Make/files
`$(derivedFvPatchFields)/oscillatingFixedValue/oscillatingFixedValueFvPatchFields.C`
and then 'wmake libso' at the /Make same grade path to change the libfiniteVolume.
