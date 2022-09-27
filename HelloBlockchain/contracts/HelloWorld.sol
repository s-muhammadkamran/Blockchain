//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HelloWorld {
    string private helloMessage = "Hello World of Blockchain!";

    function getHelloWorldMessage() public view returns (string memory) {
        return helloMessage;
    }
}