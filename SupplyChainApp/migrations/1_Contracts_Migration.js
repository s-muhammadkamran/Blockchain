const ERC20Token = artifacts.require("ERC20Token");
const SupplyChain = artifacts.require("SupplyChain");

module.exports = function (_deployer) {
    _deployer.deploy(ERC20Token, 10000, "TotalSem Token", 18, "TotalSem");
    _deployer.deploy(SupplyChain);
};