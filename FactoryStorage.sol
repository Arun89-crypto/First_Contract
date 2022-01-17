// SPDX_License_Identifier: MIT
pragma solidity ^0.6.0;

// importing simple storage contract
import "./SimpleStorage.sol";

// creating storage factory contract
contract StorageFactory {
    // creating a simple storage array that will store all the contracts created by the user
    SimpleStorage[] public simpleStorageArray;

    // function to create a new simpleStorage contract
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // creating a simple storage contract instance
        simpleStorageArray.push(simpleStorage); // pushing created contract to simpleStorageArray
    }

    // To interact with the created contract we need
    // * Address
    // * Application Binary Interface (ABI)

    // Function to store value in the contract defined by the index of array
    function sFStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)
        public
    {
        // getting the contract to interact
        SimpleStorage simpleStorage = SimpleStorage(
            address(simpleStorageArray[_simpleStorageIndex])
        );
        // storing the value in contarct
        simpleStorage.store(_simpleStorageNumber);
    }

    // Function to call the retrieve function in contract
    function sFGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // getting the contract to interact
        SimpleStorage simpleStorage = SimpleStorage(
            address(simpleStorageArray[_simpleStorageIndex])
        );
        // storing the value in contarct
        return simpleStorage.retrieve();
    }
}
