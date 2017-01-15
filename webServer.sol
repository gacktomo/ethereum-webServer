pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    string data;
  }

  mapping(bytes32 => pageData) public pages;
  //event RegisterEvent(address owner, string data);

  function set(string name, string data) returns (bool result){
    var name32 = stringToBytes32(name);
    if (pages[name32].owner != 0) {
        if (pages[name32].owner != msg.sender) {
            return false;
        }
    }
    pages[name32].owner = msg.sender;
    pages[name32].data = data;
    return true;
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
