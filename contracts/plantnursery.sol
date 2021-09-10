pragma solidity ^0.8.0;

import "./ownable.sol";
import "./safemath.sol";

contract PlantNursery is Ownable {
    using SafeMath for uint256;
    event NewPlant(uint256 plantId, uint256 dna);

    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    struct Plant {
        uint256 dna;
    }

    Plant[] public plants;

    mapping(uint256 => address) public plantToOwner;
    mapping(address => uint256) ownerPlantCount;

    function _createPlant(uint256 _dna) internal {
        plants.push(Plant(_dna));
        uint256 id = plants.length - 1;
        plantToOwner[id] = msg.sender;
        ownerPlantCount[msg.sender].add(1);
        emit NewPlant(id, _dna);
    }

    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // TODO: dont rely on a name for rand dna
    function createRandomPlant(string memory _name) public {
        require(ownerPlantCount[msg.sender] == 0);
        uint256 randDna = _generateRandomDna(_name);
        randDna = randDna - (randDna % 100);
        _createPlant(randDna);
    }
}
