// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "../Library/PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
     AggregatorV3Interface internal dataFeed;
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

  

    uint public minimumUSD = 5 * 1e18;
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressTofundAmount;

    function fund() public payable  {
        require(msg.value.getConversionRate(dataFeed) >= minimumUSD, "Funding amount too low");
        funders.push(msg.sender);
        addressTofundAmount[msg.sender] += msg.value;

    }
    function withdraw()public {
        for(uint256 i = 0; i < funders.length; i++){
            address funderAddress = funders[i];
            addressTofundAmount[funderAddress] = 0;
        }
        funders = new address[](0);
    }

}
