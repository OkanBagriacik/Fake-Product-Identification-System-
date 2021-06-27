// SPDX-License-Identifier: UNLICENSED" for non-open-source code.
pragma solidity ^0.6.12;
pragma experimental ABIEncoderV2;

// Data for testing the functions
// createCode:          "11", "Nike", "Jordan", 0, "Limited Edition", "Pratibha Co.", "Mumbai", "11:00"
//                      "22", "Adidas", "Air", 0, "It's limited", "Prabhat Co.", "GUjarat", "12:00"
//                      "33", "Reebok", "Ball", 0, "It's limited", "Prabhat Co.", "GUjarat", "12:00"
// createCustomer:      "81bd53649936d1e82c64ed216d9d7490", "Kyle", "9869245690"
//                      "1c29fb983dbe92474a199631dca38fc6", "Calden", "9123456789"
// createRetailer:      "1111", "Lifestyle", "Andheri"
// addRetailerToCode:   "11", "67xasdbsdfshjd89724hjdsf"
// initialOwner:        "11", "Lifestyle", "Kyle"
//                      "22", "ShopersStop", "Calden"
// changeOwner          "11", "Calden", "Kyle"

// TODO:
// Remove timestamp from createCustomer
// Removed onlyOwner from Retailer

contract Fake Product Identification System {
    address owner;
    // string temp;
    // function Authentifi(string _temp) public {
    //     temp = _temp;
    // }

    // A struct which helps create a new code
    // code is a combination of - brand name, model no, status, description,
    // manufacturer details, retailer details, owner details
    struct codeObj {
        uint status;
        string brand;
        string model;
        string description;
        string manufactuerName;
        string manufactuerLocation;
        string manufactuerTimestamp;
        string retailer;
        string[] customers;

      
    }

   
    mapping (string => codeObj) codeArr;

    /*
    function createOwner() public {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function whoIsOwner() public view returns (address) {
        return owner;
    }
*/
    // Function to create a new code for the product
    function createCode( string memory _code,  string memory  _brand,   string  memory _model, uint _status,   string  memory _description,  string  memory _manufactuerName,  string memory _manufactuerLocation,  string memory _manufactuerTimestamp) public payable returns (uint) {

  codeObj memory newCode;
        newCode.brand = _brand;
        newCode.model = _model;
        newCode.status = _status;
        newCode.description = _description;
        newCode.manufactuerName = _manufactuerName;
        newCode.manufactuerLocation = _manufactuerLocation;
        newCode.manufactuerTimestamp = _manufactuerTimestamp;
        codeArr[_code] = newCode;
        return 1;
    }

    // Function for showing product details if the person scanning the product is not the owner
    function getNotOwnedCodeDetails(string memory _code) public view returns (string memory, string memory, uint, string memory, string memory, string memory, string memory) {
        return (codeArr[_code].brand, codeArr[_code].model, codeArr[_code].status, codeArr[_code].description, codeArr[_code].manufactuerName, codeArr[_code].manufactuerLocation, codeArr[_code].manufactuerTimestamp);
    }


}