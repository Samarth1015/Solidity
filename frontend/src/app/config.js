import { http, createConfig } from "wagmi";
import { mainnet } from "wagmi/chains";

export const config = createConfig({
  chains: [mainnet],
  transports: {
    [mainnet.id]: http(
      "https://eth-mainnet.g.alchemy.com/v2/HIvcyzCbcb1iO-nM51LCMBtGqGhO8XMl"
    ),
  },
});
