// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SupplyChain {

  uint32 public product_id = 0;
  uint32 public participant_id = 0;
  uint32 public owner_id = 0;

  struct product {
    string modelNumber;
    string partNumber;
    string serialNumber;
    address productOwner;
    uint32 cost;
    uint32 mfgTimeStamp;
  }
  mapping(uint32 => product) public products;

  struct participant {
    string userName;
    string password;
    string participantType;
    address participantAddress;
  }
  mapping(uint32 => participant) public participants;

  struct ownership {
    uint32 productId;
    uint32 ownerId;
    uint32 trxTimeStamp;
    address productOwner;
  }
  mapping(uint32 => ownership) public ownerships;
  mapping(uint32 => uint32[]) public productTrack;

  event TransferOwnership(uint32 indexed productId);

  function addParticipant(string memory _name, string memory _pass, address _pAdd, string memory _pType) 
                            public returns(uint32) {
    uint32 userId = participant_id++;
    participants[userId].userName = _name;
    participants[userId].password = _pass;
    participants[userId].participantAddress = _pAdd;
    participants[userId].participantType = _pType;

    return userId;
  }

  function getParticipant(uint32 _product_id) 
                            public view returns (string memory, address, string memory) {
    return (participants[_product_id].userName, 
            participants[_product_id].participantAddress, 
            participants[_product_id].participantType);
  }

  function addProduct(uint32 _ownerId, string memory _modelNumber, string memory _partNumber, string memory _seriaNumber, uint32 _productCost) 
                        public returns(uint32) {
    uint32 productId = 0;
    // We can't compare string in Solidity, hence we have to hash them and then compare hashes.
    if(keccak256(abi.encodePacked(participants[_ownerId].participantType)) == keccak256("Manufacturer")) {
      productId = product_id++;
      products[productId].modelNumber = _modelNumber;
      products[productId].partNumber = _partNumber;
      products[productId].serialNumber = _seriaNumber;
      products[productId].cost = _productCost;
      products[productId].productOwner = participants[_ownerId].participantAddress;
      products[productId].mfgTimeStamp = uint32(block.timestamp); //Now is deprecated      
    }
    return productId;
  }

  modifier onlyOwner(uint32 _productId) {
    require(msg.sender == products[_productId].productOwner, "");
    _;
  }

  function getProduct(uint32 _product_id) 
                        public view returns (string memory, string memory, string memory, address, uint32) {
    return (products[_product_id].modelNumber, 
            products[_product_id].partNumber, 
            products[_product_id].serialNumber,
            products[_product_id].productOwner,
            products[_product_id].cost);
  }

  // onlyOwner modifier says that this function will only run if the condition in onlyOnwer is true
  function newOwner(uint32 _user1Id, uint32 _user2Id, uint32 _prodId) onlyOwner(_prodId) public returns(bool) {
    participant memory p1 = participants[_user1Id];
    participant memory p2 = participants[_user2Id];
    uint32 ownership_id = owner_id++;

    if(
        (keccak256(abi.encodePacked(p1.participantType)) == keccak256("Manufacturer")
        && keccak256(abi.encodePacked(p2.participantType)) == keccak256("Supplier"))
          ||
        (keccak256(abi.encodePacked(p1.participantType)) == keccak256("Supplier")
        && keccak256(abi.encodePacked(p2.participantType)) == keccak256("Supplier"))
          ||
        (keccak256(abi.encodePacked(p1.participantType)) == keccak256("Supplier")
        && keccak256(abi.encodePacked(p2.participantType)) == keccak256("Consumer"))
      ) {
      ownerships[ownership_id].productId = _prodId;
      ownerships[ownership_id].productOwner = p2.participantAddress;
      ownerships[ownership_id].ownerId = _user1Id;
      ownerships[ownership_id].trxTimeStamp = uint32(block.timestamp);
      products[_prodId].productOwner = p2.participantAddress;
      productTrack[_prodId].push(ownership_id);
      // Raise event
      emit TransferOwnership(_prodId);

      return true;
    }
    
    return false;
  }

  function getProvenance(uint32 _prodId) external view returns(uint32[] memory) {
    return productTrack[_prodId];
  }

  function getOwnership(uint32 _regId) public view returns (uint32, uint32, address, uint32) {
    ownership memory r = ownerships[_regId];
    return (r.productId, r.ownerId, r.productOwner, r.trxTimeStamp);
  }

  function authenticateParticipant(uint32 _uid, string memory _uname, string memory _pass, string memory _utype) public view returns (bool) {
    if(keccak256(abi.encodePacked(participants[_uid].participantType)) == keccak256(abi.encodePacked(_utype)))
      if(keccak256(abi.encodePacked(participants[_uid].userName)) == keccak256(abi.encodePacked(_uname)))
        if(keccak256(abi.encodePacked(participants[_uid].password)) == keccak256(abi.encodePacked(_pass)))
          return true;
    
    return false;
  }
}