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

Description
    Given a volScalarField, write the field in Comsol input interpolation 
    function form.


\*---------------------------------------------------------------------------*/

#include "writeComsolFiles.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

namespace Foam
{

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

void writeComsolField
(
    const volScalarField& phi,
    const vectorField& centers,
    Ostream& stream
)
{
    const scalarField& phiField = phi;
    const vectorField& coords = centers;

    forAll(phiField, celli)
    {
	stream
		<< coords[celli].x() << " "
		<< coords[celli].y() << " "
		<< coords[celli].z() << " "
		<< phiField[celli] << endl;
    }

}


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
void writeComsolField
(
    const volVectorField& phi,
    const vectorField& centers,
    Ostream& stream1,
    Ostream& stream2,
    Ostream& stream3
)
{
    const vectorField& phiField = phi;
    const vectorField& coords = centers;

    forAll(phiField, celli)
    {
	stream1
		<< coords[celli].x() << " "
		<< coords[celli].y() << " "
		<< coords[celli].z() << " "
		<< phiField[celli].x() << endl;
    }

    forAll(phiField, celli)
    {
	stream2
		<< coords[celli].x() << " "
		<< coords[celli].y() << " "
		<< coords[celli].z() << " "
		<< phiField[celli].y() << endl;
    }

    forAll(phiField, celli)
    {
	stream3
		<< coords[celli].x() << " "
		<< coords[celli].y() << " "
		<< coords[celli].z() << " "
		<< phiField[celli].z() << endl;
    }
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

} // End namespace Foam

// ************************************************************************* //
