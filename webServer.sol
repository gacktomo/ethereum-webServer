pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    string data;
  }

  mapping(bytes32 => pageData) public pages;
  //event RegisterEvent(address owner, string data);

  function set(string name, string data) {
    //if (domainList[domain].used==true) return false;
    var name32 = stringToBytes32(name);
    pages[name32].owner = msg.sender;
    pages[name32].data = data;
    //RegisterEvent(msg.sender, data);
  }

  function get(string name) constant returns (string data){
    var name32 = stringToBytes32(name);
    return pages[name32].data;
  }

  function stringToBytes32(string memory source) returns (bytes32 result) {
    assembly {
        result := mload(add(source, 32))
    }
  }
}
