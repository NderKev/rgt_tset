// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;


/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

 /**
   * @title RGTTokenProcessor Smart Contract
   * @dev This contracts allows investors to stake ERC20s and earn rewards based on a time and amount metrics
   * @author Kelvin Ndereba
   */

contract RGTTokenProcessor  {
  using SafeMath for uint256;
  
  
  uint256 public _slot = 86400;
  uint256 public _rate = 10;
  uint256 public _stakedTokens;

  

  IERC20 public _token;
  IERC20 public _rewardToken;

  uint256 private _rewardPool = 10000;

  mapping (address => uint256) public _investment;
  mapping (address => uint256) public _asset;
  mapping (address => uint256) public _rewards;
  mapping (address => uint256) public _assetRewardPaid;
  

  mapping (address => uint256) private _investTime;
  mapping (address => uint256) private _rewardTime;

  
   constructor (IERC20 token, IERC20 rewardToken) public {
       _token = IERC20(token);
       _rewardToken = IERC20(rewardToken);

   }

   /**
     * @dev rewardPerAsset calaculates the exac number of tokens to be rewarded 
     *    based on the invested amount and elapsed time since staking.
     * @param investor the staking address
     * @return it returns the number of tokens gained within the elapsed time and rate
     */

   function rewardPerAsset(address investor) public view returns (uint256) {
        if (_rewardPool == 0) {
            return 0;
        }
      
        uint256 _amount = _asset[investor];
        uint256 _lastRewardTime = _rewardTime[investor];
        if(_lastRewardTime == 0){
          _lastRewardTime = _investTime[investor];
        }

        uint256 elapsed = block.timestamp.sub(_lastRewardTime);
        return
            _amount.mul(elapsed).mul(1e4).div(_slot).div(_rate);
    }
    /**
      * @dev earnings calaculates the amount of tokens earned since staking time.
      * The logic here subtracts the total reward payable at that tim from reward received.
      * @return total tokens payable at the time of request
      */
    function earnings(address investor) public view returns (uint256) { 
        return
            ((rewardPerAsset(investor).sub(_assetRewardPaid[investor])));
    }
    /**
      * @dev isDecimal is a modifier that check to enforce that the contract only receives tokens
      * in multiples of 10. It reverts if the amount is less than 10 or not its multiple.
      * @param amount is the amount to be stacked.
      */
    modifier isDecimal(uint256 amount) {
         require(amount >= 10 && amount.mod(10) == 0, "amount must be a multiple of 10");
         _;
    }
    /**
      * @dev computeReward a modifier that keeps track of the reward to make sure 
      * it does not exceed the total payable reward and also that the payments are 
      * reflected and recorded as well. 
      * @param investor the staking address
      */
    modifier computeReward(address investor) {
        uint256 _reward = rewardPerAsset(investor);
        
        _rewards[investor] = earnings(investor);
        _assetRewardPaid[investor] = _reward;
        _;
    }

    /** @dev approveContract the function allows the investor to approve the contract with a token amount.
      * This amount should be equal to staking value. 
      * This function should be executed before stakeAsset function.
      * @param amount the staking token value
      * @notice the amount does not include the token number of decimals
      */

    function approveContract(uint256 amount) external {
         uint256  amount_ = amount.mul(1e4);
        _token.approve(address(this), amount_);
    }
    

    /** @dev stakeAsset the function allows the investor to stake a given amount of ERC20s.
      * It transfers the invested amount from the investor to the contract and creates assets
      * by dividng the number of tokens by 10.
      * This function shoukd be executed after approveContract function.
      * @param amount the desired erc20 token investment amount
      * @notice the amount does not include the token number of decimals
      */

    function stakeAsset(uint256 amount) external isDecimal(amount) computeReward(msg.sender) {
         uint256 _amount = amount.div(10);
        require(_amount <= _rewardPool, "amount not rewardable");
        _asset[msg.sender] += _amount; 
         uint256  amount_ = amount.mul(1e4);
         _rewardPool -= _amount;
        _investTime[msg.sender] = block.timestamp;
        _investment[msg.sender] += amount_;
        _stakedTokens += amount_;
        _token.transferFrom(msg.sender, address(this), amount_);
    }

    /**
      * @dev withdrawTokens it allows investors withdraw tokens from the contract at any time.
      * It checks if the amount to be withdrawn is less than or equal to the token amount invested.
      * if so it transfers tokens from the contract to the investor.
      * @param amount the amount of tokens to withdraw from the staked amount
      * @notice the amount does not include the token number of decimals 
      */

    function withdrawTokens(uint256 amount) external computeReward(msg.sender) {
         uint256 _amount = _investment[msg.sender];
         uint256 amount_ = amount.mul(1e4);
         require(amount_ <= _amount, "invalid withdarawal token amount");
        _investment[msg.sender] -= amount_;
        _stakedTokens -= amount_;
        _token.transfer(msg.sender, amount_);
    }
    /**
      * @dev getRewarded is a faunction that lets the user withdraw their earned rewards at any time.
      * The user must have staked tokens to the contract before withdrawing.
      * The contract transfers reward native tokens from the contract from the contract to the user.
      */

    function getRewarded() external computeReward(msg.sender) {
        uint256 reward = _rewards[msg.sender];
        _rewards[msg.sender] = 0;
        _rewardTime[msg.sender] = block.timestamp;
        
        _rewardToken.transfer(msg.sender, reward);
    }
  
}