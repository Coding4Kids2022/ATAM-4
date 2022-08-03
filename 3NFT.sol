// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private currentTokenId;
    string public url;


    // Creating a mapping
    mapping (address => uint) result;



    constructor(string memory link)  ERC721("The bored Chicken", "(TBC)") {
          url = link;
    }
              
    function mint()payable public {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(msg.sender, newItemId);
       require(result[msg.sender]<2);
       result [msg.sender] += 1 ;
    }
           
     function tokenURI(uint256 tokenID) public view override returns (string memory) {
         return string(abi.encodePacked(url, Strings.toString(tokenID),".json"));



       


     }
}
