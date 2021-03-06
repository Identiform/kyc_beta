pragma solidity ^0.4.21;

import "./Ownable.sol";

contract Relay is Ownable {
    address public currentVersion;

    function Relay() public {
        currentVersion = address(0);
    }

    function changeContract(address newVersion) public onlyOwner {
        currentVersion = newVersion;
    }

    function () external {
        require(currentVersion.delegatecall(msg.data));
    }

}
