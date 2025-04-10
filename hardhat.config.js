require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    hardhat: {},
    localhost: {
      url: "http://127.0.0.1:8545", // Connect to the local Ganache node
      accounts: [
        "0x7dd8896a68d9b979d3623da024963f1cc7bc740f4a25d686aa1787e678eb21d5",
      ], // Your wallet private key (for deployment)
    },
  },
};
