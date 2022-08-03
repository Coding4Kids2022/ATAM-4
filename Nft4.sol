// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private currentTokenId;
    string public url;

    
    address public owner;

    constructor(string memory link,address besitzer)  ERC721("Steuerung", "Strg") {
          url = link;
            owner = besitzer;
    }
              
    function mint() payable public {
        require  (msg.value>0.01 ether);
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(msg.sender, newItemId);
    }
    
        function tokenURI(uint256 tokenID) public view override returns (string memory) {
        return string(abi.encodePacked(url, Strings.toString(tokenID),".json"));
     }

    
        function withdraw()public{
     
        payable (msg.sender).transfer (address(this).balance);
        
       }
    


        
        
    
      
      
      
        modifier onlyOwner() {                                 
        	require (msg.sender == owner);_;
    
        }


}


