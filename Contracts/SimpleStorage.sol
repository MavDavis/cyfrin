// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    // Defaults to 0 if uninitialized
    uint256 public myNumber;

    struct Person {
        uint256 number;
        string name;
    }

    Person[] public listOfPeople;

    function addPerson(uint256 _number, string memory _name) public  {
        Person memory newUser = Person({number: _number, name: _name});
        listOfPeople.push(newUser);
    }
    function getPeople() public view returns (Person[] memory) {
        return listOfPeople;
    }
mapping (address => string) users;
function addUsers(address _id,string memory _name) public{
    users[_id]=_name;
}
function fetchUsers(address _id)public view returns (string memory){
    return users[_id];
}
}