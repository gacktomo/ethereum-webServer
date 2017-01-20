pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    bytes[] data;
  }

  mapping(bytes32 => mapping(bytes32 => pageData)) public pages;
  event RegisterEvent(address owner, bytes data);

  function set(bytes32 domain, bytes32 name, bytes data) returns (bool result){
    if (pages[domain][name].owner != 0) {
        if (pages[domain][name].owner != msg.sender) {
            return false;
        }
    }
    pages[domain][name].owner = msg.sender;
    pages[domain][name].data.push(data);
    RegisterEvent(msg.sender, data);

    return true;
  }

  function get(bytes32 domain, bytes32 name, uint index) returns (bytes data){
    return pages[domain][name].data[index];
  }

  function getlen(bytes32 domain, bytes32 name) constant returns (uint leng){
    return pages[domain][name].data.length;
  }
}
