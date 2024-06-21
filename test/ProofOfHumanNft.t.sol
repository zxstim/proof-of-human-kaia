// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ProofOfHuman} from "../src/ProofOfHumanNft.sol";

contract ProofOfHumanTest is Test {
    ProofOfHuman public proofOfHuman;

    function setUp() public {
        proofOfHuman = new ProofOfHuman(0xe3d25540BA6CED36a0ED5ce899b99B5963f43d3F);
    }

    function testOwner() view public {
        address owner = proofOfHuman.owner();
        assertEq(owner, 0xe3d25540BA6CED36a0ED5ce899b99B5963f43d3F);
    }
}
