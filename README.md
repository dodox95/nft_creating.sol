# nft_creating.sol
The MyNFT contract is an ERC721-enumerable NFT from OpenZeppelin. It supports custom image URIs, names, and descriptions for tokens. On deployment, it mints an initial token with predefined metadata. Overrides the tokenURI function for dynamic metadata generation.

MyNFT Smart Contract
Overview
MyNFT is a customizable ERC721-enumerable NFT, harnessing OpenZeppelin's robustness. Beyond traditional token minting, this contract encapsulates unique metadata for each NFT: image URIs, names, and descriptions.

Features
Custom Metadata: Each token has its own image URI, name, and description.
Initial Minting: Automatically mints a token on deployment with predefined attributes.
Dynamic Metadata: Overrides the standard tokenURI function to produce on-the-fly metadata for tokens.
Setup
To deploy MyNFT, you need to import necessary components from OpenZeppelin:

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

Usage
To mint a new token with your desired attributes:

_mint(receiver_address, "https://image.link", "Token_Name", "Token_Description");

To retrieve the metadata of a token:

tokenURI(token_id);

Feel free to customize the contract to better suit your NFT project needs. Happy coding!




