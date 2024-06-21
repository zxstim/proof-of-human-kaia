// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
import { ProofOfHuman } from "../src/ProofOfHumanNft.sol";

contract Deploy is Script {
    function run() external returns (ProofOfHuman) {
        vm.startBroadcast();
        ProofOfHuman proofOfHuman = new ProofOfHuman(0xe3d25540BA6CED36a0ED5ce899b99B5963f43d3F);
        vm.stopBroadcast();
        return (proofOfHuman);
    }
}