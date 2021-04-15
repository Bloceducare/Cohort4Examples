// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface payBounties {
    function splitBounties(uint256 amount) external returns (bool);
}