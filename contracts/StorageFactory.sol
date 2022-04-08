// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.0 <0.9.0;

import "./SimpleStorage.sol";
// agregar el is se obtiene todas las funciones del Simple Storage original
contract StorageFactory is SimpleStorage{

    SimpleStorage[] public SimpleStorageArray;
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        SimpleStorageArray.push(simpleStorage);
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Se requiere el address
        // Se requiere el ABI (Application binary interface)
        SimpleStorage simpleStorage = SimpleStorage(address(SimpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = SimpleStorage(address(SimpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}