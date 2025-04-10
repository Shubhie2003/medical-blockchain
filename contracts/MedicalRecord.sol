// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecord {
    string public storedMessage;

    function setMessage(string memory _message) public {
        storedMessage = _message;
    }

    function getMessage() public view returns (string memory) {
        return storedMessage;
    }
}
