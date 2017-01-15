pragma solidity ^0.4.0;
contract webServer {
  struct pageData{
    address owner;
    string data;
  }
  pageData firstPage;

  event RegisterEvent(address owner, string data);

  function webServer(string data) {
    //if (domainList[domain].used==true) return false;
    firstPage.owner = msg.sender;
    firstPage.data = data;
    RegisterEvent(msg.sender, data);
  }

  function get() constant returns (string data){
    return firstPage.data;
  }
}
