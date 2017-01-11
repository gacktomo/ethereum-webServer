pragma solidity ^0.4.0;
contract register {
  struct domainData{
    address owner;
    bool used;
  }
  mapping ( uint => domainData) public domainList;
  event RegisterEvent(address owner, uint domain);

  function registerName(uint domain) returns(bool sufficient) {
    if (domainList[domain].used==true) return false;
    domainList[domain].owner = msg.sender;
    domainList[domain].used = true;
    RegisterEvent(msg.sender, domain);
    return true;
  }
}
