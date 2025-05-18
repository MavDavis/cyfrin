 // SPDX-License-Identifier: MIT
 pragma solidity ^0.8.18;
 import {SimpleStorage} from  "./SimpleStorage.sol";
    contract storageFactory{
    SimpleStorage[] public listOfsimpleStorage;

        function createSimpleStorageInstance() public {
            listOfsimpleStorage.push (new SimpleStorage());
        }
        function getAsimpleStorageInstance(uint256 _indexOfSimpleStorage)public view returns(uint){
            return listOfsimpleStorage[_indexOfSimpleStorage].retrieve();
        }
    }