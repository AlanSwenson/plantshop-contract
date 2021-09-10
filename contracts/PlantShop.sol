pragma solidity ^0.8.0;

import "./planthelper.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract PlantShop is PlantHelper, ERC721 {
    constructor() ERC721("PlantShop", "NFT") {}
}
