pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    bytes data;
  }

  mapping(bytes32 => mapping(bytes32 => pageData)) public pages;
  //event RegisterEvent(address owner, string data);

  function set(bytes32 domain, bytes32 name, bytes data) returns (bool result){
    if (pages[domain][name].owner != 0) {
        if (pages[domain][name].owner != msg.sender) {
            return false;
        }
    }
    pages[domain][name].owner = msg.sender;
    pages[domain][name].data=data;
    return true;
    //RegisterEvent(msg.sender, data);
  }

  function get(bytes32 domain, bytes32 name) constant returns (bytes data){
    return pages[domain][name].data;
  }
}
