var ERC20Token = artifacts.require('ERC20Token');

contract('ERC20Token', function(accounts) {
  it("should assert true", function(done) {
    var erc20token = ERC20Token.deployed();
    assert.isTrue(true);
    done();
  });
});
