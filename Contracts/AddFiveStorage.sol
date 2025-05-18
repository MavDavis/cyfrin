// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFive is SimpleStorage {
    function retrieve() view public override  returns  (uint256) {
        return myNumber + 5;
    }
}