import { JsonRpcProvider, id } from "ethers";

let provider = new JsonRpcProvider(
  "https://eth-mainnet.g.alchemy.com/v2/HIvcyzCbcb1iO-nM51LCMBtGqGhO8XMl"
);

async function pollBlock(blockNumber) {
  //   try {
  console.log(provider);
  let data = await provider.getLogs({
    address: "0xdAC17F958D2ee523a2206206994597C13D831ec7",
    fromBlock: blockNumber,
    toBlock: blockNumber,
    topics: [id("Transfer(address , address , uint256 )")],
  });
  console.log(data);
  //   } catch (err) {
  //     console.error("--->", err);
  //   }
}
pollBlock(21495003);
