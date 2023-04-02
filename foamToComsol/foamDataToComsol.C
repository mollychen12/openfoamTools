/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     |
    \\  /    A nd           | www.openfoam.com
     \\/     M anipulation  |
-------------------------------------------------------------------------------
    Copyright (C) 2011-2016 OpenFOAM Foundation
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.

Application
    foamDataToComsol

Group
    grpPostProcessingUtilities

Description
    Translate OpenFOAM data to Comsol format.

\*---------------------------------------------------------------------------*/

#include "fvCFD.H"
#include "OFstream.H"
#include "IOobjectList.H"
#include "writeComsolFiles.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

int main(int argc, char *argv[])
{
    argList::addNote
    (
        "Translate OpenFOAM data to Comsol format"
    );
    argList::noParallel();
    timeSelector::addOptions(false);   // constant(false), zero(false)

    #include "setRootCase.H"
    #include "createTime.H"

    instantList timeDirs = timeSelector::select0(runTime, args);

    #include "createNamedMesh.H"

    // make a directory called comsolFiles in the case
    mkDir(runTime.rootPath()/runTime.caseName()/"comsolFiles");

    forAll(timeDirs, timeI)
    {
        runTime.setTime(timeDirs[timeI], timeI);

        Info<< "Time = " << runTime.timeName() << endl;

        // make a directory called proInterface in the case
        mkDir(runTime.rootPath()/runTime.caseName()/"comsolFiles");

        // open a file for the mesh
        OFstream UxFile
        (
            runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
             runTime.timeName() + "Ux.txt"
        );

        OFstream UyFile
        (
            runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
            runTime.timeName() + "Uy.txt"
        );

        OFstream UzFile
        (
            runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
            runTime.timeName() + "Uz.txt"
        );

	OFstream pFile
	(
	    runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
            runTime.timeName() + "p.txt"  
	);

	OFstream kFile
	(
	    runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
            runTime.timeName() + "k.txt"  
	);

	OFstream omegaFile
	(
	    runTime.rootPath()/
            runTime.caseName()/
            "comsolFiles"/
            runTime.timeName() + "omega.txt"  
	);

        // Reading the centre coodinations of the mesh
	vectorField cellCenters = mesh.cellCentres(); 

	Info << "The mesh has " << mesh.nCells() << " cells to be converted."<< endl;

        // Search for list of objects for this time
        IOobjectList objects(mesh, runTime.timeName());
	volVectorField U(*(objects["U"]), mesh);
	volScalarField p(*(objects["p"]), mesh);
	volScalarField k(*(objects["k"]), mesh);
	volScalarField omega(*(objects["omega"]), mesh);

	writeComsolField(U, cellCenters, UxFile, UyFile, UzFile);

	writeComsolField(p, cellCenters, pFile);
	writeComsolField(k, cellCenters, kFile);	
	writeComsolField(omega, cellCenters, omegaFile);
	
	Info << "Transfer foam to comsol is done!";
        Info<< endl;
    }

    Info<< "End\n" << endl;

    return 0;
}


// ************************************************************************* //
