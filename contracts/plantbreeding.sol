pragma solidity ^0.8.0;

import "./plantnursery.sol";

/// plant breeding logic
contract PlantBreeding is PlantNursery {
    modifier onlyOwnerOf(uint256 _plantId) {
        require(msg.sender == plantToOwner[_plantId]);
        _;
    }
}
