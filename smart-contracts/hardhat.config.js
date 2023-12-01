require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers");
require("hardhat-gas-reporter");
require("solidity-coverage");
require("dotenv").config();

const ALCHEMY_API_KEY = process.env.POLYGON_URL;
const PRIVATE_KEY = process.env.PRIVATE_METAMASK_KEY;
const MUMBAISCAN_API_KEY = process.env.MUMBAISCAN;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "mumbai",
  etherscan: {
    apiKey: {
      polygonMumbai: MUMBAISCAN_API_KEY,
    },
  },
  networks: {
    mumbai: {
      url: ALCHEMY_API_KEY,
      accounts: [PRIVATE_KEY],
      chainId: 80001,
    },
  },
  sourcify: {
    enabled: false,
  },
};
