// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ProofOfHuman} from "../src/ProofOfHumanNft.sol";

contract ProofOfHumanTest is Test {
    ProofOfHuman public proofOfHuman;
    address onlyOwner = 0xe3d25540BA6CED36a0ED5ce899b99B5963f43d3F;
    address secondAddress = 0x1B7a0b3E366CC0549A96ED4123E8058d59282f3f;

    function setUp() public {
        proofOfHuman = new ProofOfHuman(onlyOwner);
    }

    function test_Owner() view public {
        address owner = proofOfHuman.owner();
        assertEq(owner, onlyOwner);
    }

    function test_Name() view public {
        string memory name = proofOfHuman.name();
        assertEq(name, "ProofOfHuman");
    }

    function test_Symbol() view public {
        string memory symbol = proofOfHuman.symbol();
        assertEq(symbol, "POH");
    }

    function test_SafeMint() public {
        vm.prank(onlyOwner);
        proofOfHuman.safeMint(onlyOwner, 0, "testURI");
        address ownerOf = proofOfHuman.ownerOf(0);
        assertEq(ownerOf, onlyOwner);
    }

    function testFail_SafeTransferFrom() public {
        vm.prank(onlyOwner);
        proofOfHuman.safeMint(onlyOwner, 0, "test");
        proofOfHuman.safeTransferFrom(onlyOwner, secondAddress, 0);
    }
}
