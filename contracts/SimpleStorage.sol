// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.0 <0.9.0;

contract SimpleStorage {
    // this will get initialized to 0
    // uint es unsigned integer(positivo o negativo) 256 es el size en bits
    // public ayuda a presentar la visibility of the content
    uint256 favoritenumber;

    struct People {
        uint256 favoritenumber;
        string name;
    }
    // [] es para arrays o listas y se puede poner limite como [1] donde solo dejaria introducir 1
    People [] public people;
    mapping(string => uint256) public nametofavoritenumber;

    function store(uint256 _favoritenumber) public {
        favoritenumber = _favoritenumber;
    }
    // view and pure do not require transactions y por eso son azul y no naranja
    function retrieve() public view returns(uint256) {
        return favoritenumber;
    }
    // memory solo stores during execution, storage exists after execution
    function addperson (string memory _name, uint256 _favoritenumber) public{
        people.push(People(_favoritenumber,_name));
        nametofavoritenumber[_name] = _favoritenumber;
    }
}