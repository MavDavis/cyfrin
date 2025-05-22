// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe{
    uint public minimumUSD = 5;
    function fund() public payable  {
        require(msg.value > minimumUSD, "Funding amount too low");
    }
    // function withdraw()public {

    // }
}