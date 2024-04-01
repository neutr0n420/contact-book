// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {
    address private owner;
    struct Contact {
       string name;
       address wallet;
    }
    Contact[] private contacts;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner {
       require( msg.sender == owner, "Only owner can call this function"); 
       _;
    }
    function addContact(string memory _name, address _wallet) public onlyOwner {
        contacts.push(Contact(_name, _wallet));
    }
    function removeContact(uint _index) public onlyOwner{
        require(_index < contacts.length, "Index out of bounds");
        for (uint i = _index; i < contacts.length; i++) {
            contacts[i] = contacts[i+1]; 
        }
        contacts.pop();
    }
    function getContacts() public view returns (Contact[] memory) {
        return contacts;
    } 
}
