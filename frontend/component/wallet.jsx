import {
  useAccount,
  useConnect,
  useConnectors,
  useDisconnect,
  useReadContract,
} from "wagmi";
import { abi } from "../src/app/abi";

export default function Wallet() {
  const connectors = useConnectors();
  const { connect } = useConnect();
  const { address } = useAccount();
  const { disconnect } = useDisconnect();
  const { data, isloading, error } = useReadContract({
    abi: abi,
    address: "0xdAC17F958D2ee523a2206206994597C13D831ec7",
    functionName: "totalSupply",
  });

  return (
    <>
      {address ? (
        <>
          <p>User Connected: {address}</p>
          <button className="h-5 bg-red-400 ml-8" onClick={() => disconnect()}>
            Disconnect
          </button>
          {isloading ? (
            <p>Loading total supply...</p>
          ) : error ? (
            <p style={{ color: "red" }}>Error: {error.message}</p>
          ) : (
            <div>Total Supply: {data?.toString()}</div>
          )}
        </>
      ) : (
        <>
          <p>Connect your wallet:</p>
          {connectors.map((connector, idx) => (
            <button
              onClick={() => connect({ connector })}
              className="mr-12"
              key={idx}
            >
              {connector.name}
            </button>
          ))}
        </>
      )}
    </>
  );
}
