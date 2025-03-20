pragma solidity ^0.8.0;

contract ReferralProgram {
    mapping(address => uint256) public rewards;
    mapping(address => address) public referrer;

    uint256 public rewardAmount = 10 * (10 ** 18); // Example reward

    function registerReferral(address newUser, address referrerAddress) public {
        if (referrer[newUser] == address(0) && newUser != referrerAddress) {
            referrer[newUser] = referrerAddress;
            rewards[referrerAddress] += rewardAmount;
        }
    }

    function getRewardBalance(address user) public view returns (uint256) {
        return rewards[user];
    }
}
