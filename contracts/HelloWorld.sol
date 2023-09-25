// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HelloWorld {
    bytes32 public text;
    address public owner;

    constructor() {
        text = bytes32("Hello World!");
        owner = msg.sender;
    }

    function helloWorld() external view returns (bytes32) {
        return text;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function setText(bytes32 newText) external onlyOwner {
        text = newText;
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}