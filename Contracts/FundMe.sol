// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "../Library/PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    address immutable i_owner;
     AggregatorV3Interface internal dataFeed;
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        i_owner = msg.sender;
    }

  
    // constant are used when value of an element won't chang
    // immutables are used when they are changed once
    uint256 public constant minimumUSD = 5 * 1e18;
    address[] public funders;
    mapping (address funder => uint256 amountFunded) public addressTofundAmount;

    function fund() public payable  {
        require(msg.value.getConversionRate(dataFeed) >= minimumUSD, "Funding amount too low");
        funders.push(msg.sender);
        addressTofundAmount[msg.sender] += msg.value;

    }
    function withdraw()public onlyOwner {
        for(uint256 i = 0; i < funders.length; i++){
            address funderAddress = funders[i];
            addressTofundAmount[funderAddress] = 0;
        }
        funders = new address[](0);
    //    bool res = payable((msg.sender).transfer(address(this).balance);
        (bool callSuccess, ) = msg.sender.call{value: address(this).balance}("");
            require(callSuccess, "Withdrawal failed");
    }
    modifier onlyOwner(){
        require(msg.sender == i_owner,"You cannot withdraw unless you are the owner");
        _;
    }

}
