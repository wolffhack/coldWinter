const hre = require("hardhat");

async function main() {
  const lock = await hre.ethers.getContractFactory("PiedraPapelTijera");
  const lock2 = await lock.deploy();
  await lock2.deployed;

  console.log(lock2.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
