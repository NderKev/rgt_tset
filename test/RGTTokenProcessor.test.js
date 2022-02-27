import { reverting } from './shouldFail';

const RGTTokenProcessor = artifacts.require('RGTTokenProcessor')
const RGTRewardToken = artifacts.require('RGTRewardToken')
const RGTTOKEN = artifacts.require('RGTTOKEN')

var BN = web3.utils.BN;
const BigNumber = web3.BigNumber;
const tokenName = 'RGGTTOKEN';
const tokenSymbol = 'RGGT';
const rewardName = 'RGTRewardToken';
const rewardSymbol = 'RGGR';

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(BigNumber))
  .should();


  contract('RGTTOKEN', accounts => {
    let token;
    const creator = accounts[0];
    
  
    beforeEach(async function () {
      token = await RGTTOKEN.new(accounts[1], tokenName, tokenSymbol, { from: creator });
    });
  
    it('has a name ' + tokenName, async function () {
      const name = await token.name();
      assert.equal(name, tokenName);
    });
  
    it('has a symbol ' + tokenSymbol, async function () {
      const symbol = await token.symbol();
      assert.equal(symbol, tokenSymbol);
    });
  
    it('has 4 decimals', async function () {
      const decimals = await token.decimals();
      decimals.toNumber().should.eq(4);
    });
  });
  
  contract('RGTRewardToken', accounts => {
    let token;
    const creator = accounts[0];
    
  
    beforeEach(async function () {
      token = await RGTRewardToken.new(accounts[1], rewardName, rewardSymbol, { from: creator });
    });
  
    it('has a name ' + tokenName, async function () {
      const name = await token.name();
      assert.equal(name, rewardName);
    });
  
    it('has a symbol ' + tokenSymbol, async function () {
      const symbol = await token.symbol();
      assert.equal(symbol, rewardSymbol);
    });
  
    it('has 4 decimals', async function () {
      const decimals = await token.decimals();
      decimals.toNumber().should.eq(4);
    });
  });
  

  contract('RGTTokenProcessor', async([accounts, stake, reward]) => {
    let token;
    const creator = accounts[0];
    const amount = 100;
    const deduct = 10;
    let investment, timestamp;
    
  
    beforeEach(async function () {
      token = await RGTTokenProcessor.new(stake, reward, { from: creator});
      await this.token.stakeAsset(amount, {from : creator})
      timestamp = this.token._investTime(creator).toNumber();
      investment = await token._investment(creator).toNumber();
      
      
    });
  
    it('checks if tokens are staked successfully' + amount, async function () {
      const total = await token._stakedTokens().toNumber();
      const expected = amount * 1e4;
      assert.equal(total, expected);
    });
  
    it('checks if assets are calculated correctly' + investment, async function () {
      const result = amount/10;
      const asset = _asset(creator).toNumber();
      assert.equal(asset, result);
    });
      
     
    it('check if the user can withraw tokens successfully', deduct, async function () {
        await this.token.withdrawTokens(deduct);
        const deducted = this.token._investment(creator).toNumber();
        const deductions = deduct * 1e4;
        const aggregate = investment - deductions;
        assert.equal(deducted, aggregate);
        
    });


  });

