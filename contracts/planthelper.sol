pragma solidity ^0.8.0;

import "./plantbreeding.sol";
import "./safemath.sol";

contract PlantHelper is PlantBreeding {
    using SafeMath for uint256;

    function withdraw() external onlyOwner {
        address _owner = owner();
        payable(_owner).transfer(address(this).balance);
    }

    function getPlantsByOwner(address _owner)
        external
        view
        returns (uint256[] memory)
    {
        uint256[] memory result = new uint256[](ownerPlantCount[_owner]);
        uint256 counter = 0;
        for (uint256 i = 0; i < plants.length; i++) {
            if (plantToOwner[i] == _owner) {
                result[counter] = i;
                counter.add(1);
            }
        }
        return result;
    }

    function getPlantsOwners() public view returns (Plant[] memory) {
        return plants;
    }
}
