import Web3 from "web3";

let web3 = new Web3(new Web3.providers.HttpProvider("HTTP://127.0.0.1:7545"));

async function get() {
  let bal = await web3.eth.getBalance(
    "0xc37bFCDf0f61A70CADA2CD3e5055BF17Cd86Cba5"
  );
  console.log(web3.utils.fromWei(bal, "ether"));
  web3.eth.sendTransaction({
    from: "0xc37bfcdf0f61a70cada2cd3e5055bf17cd86cba5",
    to: "0xda75816c0f04657229e6075c370115cd196653c6",
    value: web3.utils.toWei(94, "ether"),
  });
}

get();
