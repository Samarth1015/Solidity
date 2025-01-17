"use client";

import { WagmiProvider } from "wagmi";
import { config } from "./config";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { id, JsonRpcProvider } from "ethers";
// import { abi } from "./abi";
let provider = new JsonRpcProvider(
  "https://eth-mainnet.g.alchemy.com/v2/HIvcyzCbcb1iO-nM51LCMBtGqGhO8XMl"
);

import Wallet from "../../component/wallet";
import { useEffect } from "react";
export default function Home() {
  let client = new QueryClient();
  return (
    <WagmiProvider config={config}>
      <QueryClientProvider client={client}>
        <Wallet></Wallet>
      </QueryClientProvider>
    </WagmiProvider>
  );
}
