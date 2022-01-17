<p align="center">
	<img src="BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/main.png" width="100%"></img>
</p>

# BlockChain - Solidity - First Contract

# IDE used for solidity

[https://remix.ethereum.org/](https://remix.ethereum.org/)

![Screenshot 2022-01-15 at 4.16.09 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-15_at_4.16.09_PM.png)

### Our first solidity contract →

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{
    // uint256 , int 256 (uint - unsigned integer, int - signed integer)

    // uint256 favoriteNumber = 5; // declaring a unsigned integer 5
    // bool favoriteBool = true; // declaring a boolean
    // string favoriteString = "String"; // declaring a string
    // int256 favoriteInt = -5; // declaring a integer '-5'
    // address favoriteAddress = 0x839F42a69Cc24F391DC4F09273f494578653edEC; //declaring an address
    // bytes32 favoriteBytes = "cat"; // declaring byte

    // this will get initialized to 0
    uint256 favoriteNumber;

    // declaring the function to edit the value of favoriteNumber declared above
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}
```

### How do deploy our contract on blockchain

![Screenshot 2022-01-15 at 4.29.37 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-15_at_4.29.37_PM.png)

- After deploying there will be interaction buttons here in Deployed Contracts

![Screenshot 2022-01-15 at 4.43.19 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-15_at_4.43.19_PM.png)

- but here we can’t see any option to see the favourite number so we will change our ‘favoriteNumber’ variable to public

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{

    // this will get initialized to 0
    uint256 public favoriteNumber;

    // declaring the function to edit the value of favoriteNumber declared above
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}
```

- Now we can see our option

![Screenshot 2022-01-15 at 4.55.40 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-15_at_4.55.40_PM.png)

### Function Types →

- Public Function - Anyone can call
- External Function - Function can be called by external contract
- Internal Function - Function can only be called internally.
- Private Function - Function and Variables are only visible for the contract they are defined in.

If we don’t give public to a variable or function it will automatically designated as [internal]

### View function and Pure function

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{

    // this will get initialized to 0
    uint256 public favoriteNumber;

    // declaring the function to edit the value of favoriteNumber declared above
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    // VIEW and PURE function - These function don't use transaction to operate
    // view function - view function is used to get the state of the blockchain
    // pure function - pure function is defined when some calculation is going on
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}
```

## Structures in Solidity

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{

    uint256 favoriteNumber;

    // making a structure
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    // making a structure object
    People public person = People({favoriteNumber : 2, name : "Patrick"});
}
```

## Arrays in solidity

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{

    uint256 favoriteNumber;

    // making a structure
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public people; // declaring a dynamic array

		// Function to add a person in people array
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People({favoriteNumber : _favoriteNumber, name : _name}));
    }

    // function to view favorite number
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}
```

### Difference between Memory & Storage

When we declare a variable in memory it will only be stored while execution of the program

```solidity
uint256 memory number1;
```

When we declare a variable in storage it will also be available after the function execution

```solidity
uint256 memory number2;
```

## Mapping

```solidity
pragma solidity ^0.6.0; // defining the solidity version

// creating a contract
contract SimpleStorage{

    uint256 favoriteNumber;
    // making a structure
    struct People{
        uint256 favoriteNumber;
        string name;
    }


    People[] public people; // declaring a dynamic array

    // MAPPING - A data structure to get a value in an array without iterating to it whole
    mapping(string => uint256) public nameToFavoriteNumber;
		// string as input to number as output

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People({favoriteNumber : _favoriteNumber, name : _name}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // function to view favorite number
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }
}
```

### Our final Contract

![Screenshot 2022-01-16 at 7.29.19 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-16_at_7.29.19_PM.png)

In this contract we can :

- Add person to the Array
- Get any Person from array number
- Find anyone from their favourite number

## How to deploy

![Screenshot 2022-01-16 at 9.44.30 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-16_at_9.44.30_PM.png)

- Step 1 : Select ‘Injected Web 3’ from environment then Metamask will popup and ask for connection the Click connect on that.
- Step 2 : Click Deploy. Then a popup will show up on Metamask to confirm the payment
- Step 3: Confirm the payment

After this we can check the transaction hash generated on payment and verify that on Rinkby Etherscan

```solidity
// Transaction Hash
0xe7597b6c979095355d5246489f6294df83687dfc59d7caefd995555e05ea25fa
```

Link → [https://rinkeby.etherscan.io/tx/0xe7597b6c979095355d5246489f6294df83687dfc59d7caefd995555e05ea25fa](https://rinkeby.etherscan.io/tx/0xe7597b6c979095355d5246489f6294df83687dfc59d7caefd995555e05ea25fa)

Now everytime we interact with our deployment we have to pay some gas fee

## Interaction (with Deployed Contract)

![Screenshot 2022-01-16 at 9.54.51 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-16_at_9.54.51_PM.png)

- Click Add Person.
- Metamask popup will appear for payment.

<p align="center">
	<img src="BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-16_at_9.54.23_PM.png" width="200px"></img>
</p>
    
>>>>>>> 0311ce94f26f573223b4ce136ae725b60302c3a3
- After confirming the payment hash will be generated. Check it on rinkby etherscan

```solidity
0xa3fcd67e88fd2dde08e0c5a13ffee5ed0b19b9a1728ff943314c76188cc85524
```

## Our Deployed Contract

[https://rinkeby.etherscan.io/address/0x924bdf9655e84a65cb9af6431ac9e7eb04a550f8](https://rinkeby.etherscan.io/address/0x924bdf9655e84a65cb9af6431ac9e7eb04a550f8)

## --------------------------------------------------------------------------------------------------------------

# BlockChain - Solidity(Advance Contracts)

## Creating a “Storage Factory” using simple storage we created in basics and using it to create multiple “Simple Storage” for user who interacts with “Storage Factory”

```solidity
// SPDX_License_Identifier: MIT
pragma solidity ^0.6.0;

// importing simple storage contract
import "./SimpleStorage.sol";

// creating storage factory contract
contract StorageFactory{

    // creating a simple storage array that will store all the contracts created by the user
    SimpleStorage[] public simpleStorageArray;

    // function to create a new simpleStorage contract
    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage(); // creating a simple storage contract instance
        simpleStorageArray.push(simpleStorage); // pushing created contract to simpleStorageArray
    }

    // To interact with the created contract we need
    // * Address
    // * Application Binary Interface (ABI)

    // Function to store value in the contract defined by the index of array
    function sFStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // getting the contract to interact
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        // storing the value in contarct
        simpleStorage.store(_simpleStorageNumber);
    }

    // Function to call the retrieve function in contract
    function sFGet(uint256 _simpleStorageIndex) public view returns(uint256){
        // getting the contract to interact
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        // storing the value in contarct
        return simpleStorage.retrieve();
    }
}
```

![Screenshot 2022-01-16 at 11.01.54 PM.png](BlockChain%20-%20Solidity%2032dbc76c3bc14f09992abbdd5dc0af13/Screenshot_2022-01-16_at_11.01.54_PM.png)

### Interaction window will look something like this

## If we want to inherit all the functions from on contract to another (like in inheritance in loops) we can do some thing like this

```solidity
// SPDX_License_Identifier: MIT
pragma solidity ^0.6.0;

// importing simple storage contract
import "./SimpleStorage.sol";

// creating storage factory contract
// 'is' contract__name will do our inheritence job
contract StorageFactory is SimpleStorage{
}
```
