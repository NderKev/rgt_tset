var RGTTOKEN = artifacts.require("./RGTTOKEN.sol");
var RGTRewardToken = artifacts.require("./RGTRewardToken.sol");
var RGTTokenProcessor = artifacts.require("./RGTTokenProcessor.sol");

module.exports = function(deployer) {
   deployer.deploy(RGTTOKEN,"RGTTOKEN","RGTT","0xd4D32acC1D3F9a92F2C6fB7a1030DFb8392e68Aa");
   deployer.deploy(RGTRewardToken,"RGTRewardToken","RGTR","0xd4D32acC1D3F9a92F2C6fB7a1030DFb8392e68Aa");
   deployer.deploy(RGTRewardToken,"RGTRewardToken","0x3ADe73f7b7d9F532c966F9288895D1dd2d386F99","0x5F322abA9c8CF443b76D39C80a3e3A8012EaB53e");
}