// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/token/ERC20/ERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/access/Ownable.sol";

contract WrappedToken is ERC20, Ownable {
    constructor() ERC20("WrappedMyToken", "wMTK") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

contract BridgeB {
    address public admin;
    WrappedToken public token;

    event TokensUnlocked(address indexed user, uint256 amount);

    constructor(address _token) {
        admin = msg.sender;
        token = WrappedToken(_token);
    }

    function mintWrappedTokens(address to, uint256 amount) public {
        require(msg.sender == admin, "Only admin can mint");
        token.mint(to, amount);
        emit TokensUnlocked(to, amount);
    }
}
