const SupplyChain = artifacts.require("SupplyChain");

module.exports = function (deployer) {
    deployer.deploy(SupplyChain);
};

module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
};
