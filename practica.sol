// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract calificaciones {
    struct Alumnos {
        string name;
        uint8 nota;
    }

    mapping(uint8 => Alumnos) public mapeoAlumnos;

    function getAlumno(uint8 _id) public view returns (Alumnos memory) {
        return (mapeoAlumnos[_id]);
    }

    function getAlumnos(uint8 _id) public view returns (Alumnos[] memory) {
        // generar array y devolver
    }

    function setAlumno(
        uint8 _id,
        uint8 _nota,
        string calldata _name
    ) external returns (uint8, string memory) {
        mapeoAlumnos[_id].name = _name;
        mapeoAlumnos[_id].nota = _nota;
        return (_nota, _name);
    }
}
