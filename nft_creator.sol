// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721Enumerable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(uint256 => string) private _tokenImageURIs;
    mapping(uint256 => string) private _tokenNames;
    mapping(uint256 => string) private _tokenDescriptions;

    constructor() ERC721("PINATA NFT", "PINATA") {
        _mint(msg.sender, "https://cdn.dribbble.com/userupload/9350170/file/original-75dda6f54b999c78c127813c26922e03.jpg?resize=400x400", "wojtyla_name", "description_name");
    }

    function _mint(address to, string memory imageUri, string memory name, string memory description) internal returns (uint256) {
        _tokenIds.increment();
        uint256 newNftId = _tokenIds.current();
        _safeMint(to, newNftId);
        _tokenImageURIs[newNftId] = imageUri;
        _tokenNames[newNftId] = name;
        _tokenDescriptions[newNftId] = description;
        return newNftId;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory json = string(abi.encodePacked('{',
            '"name": "', _tokenNames[tokenId], '",',
            '"description": "', _tokenDescriptions[tokenId], '",',
            '"image": "', _tokenImageURIs[tokenId], '"',
        '}'));

        string memory encodedJson = string(abi.encodePacked("data:application/json;charset=UTF-8,", json));

        return encodedJson;
    }
}
