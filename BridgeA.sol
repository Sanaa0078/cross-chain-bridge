// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract BridgeA {
    address public admin;
    IERC20 public token;

    event TokensLocked(address indexed user, uint256 amount, string targetChain, address targetAddress);

    constructor(address _token) {
        admin = msg.sender;
        token = IERC20(_token);
    }

    function lockTokens(uint256 amount, string memory targetChain, address targetAddress) public {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        emit TokensLocked(msg.sender, amount, targetChain, targetAddress);
    }
}
