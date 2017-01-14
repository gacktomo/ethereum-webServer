pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    bytes32 data;
  }
  pageData firstPage;

  //mapping ( uint => pageData) public pageList;
  event RegisterEvent(address owner, bytes32 data);

  function webServer(bytes32 data) {
    //if (domainList[domain].used==true) return false;
    firstPage.owner = msg.sender;
    firstPage.data = data;
    RegisterEvent(msg.sender, data);
  }

  function get() constant returns (bytes32 data){
    return firstPage.data;
  }
}
