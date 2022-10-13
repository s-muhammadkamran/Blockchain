const ERC20Token = artifacts.require("ERC20Token");
const SupplyChain = artifacts.require("SupplyChain");
const BasicMath = artifacts.require("BasicMath");

module.exports = function (_deployer) {
    _deployer.deploy(ERC20Token, 10000, "TotalSem Token", 18, "TotalSem");
    _deployer.deploy(SupplyChain);
    _deployer.deploy(BasicMath);
};