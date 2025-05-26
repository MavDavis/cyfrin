// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{
     AggregatorV3Interface internal dataFeed;
    constructor() {
        dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
    }

    /**
     * Returns the latest answer.
     */
    // function getChainlinkDataFeedLatestAnswer() public view returns (int) {
    //     (int256 answer) = dataFeed.latestRoundData();
    //     return answer;
    // }
    uint public minimumUSD = 5;
    function fund() public payable  {
        require(msg.value > minimumUSD, "Funding amount too low");

    }
    function returnVersion()public view returns(uint){
        return dataFeed.version();
    }
}