# cross-chain-bridge
This project demonstrates a simple cross-chain bridge implementation between two Ethereum testnets: Sepolia and Goerli. It includes:

An ERC20 token contract (MyToken) deployed on Sepolia.

A Bridge contract on Sepolia (BridgeA) to lock tokens before bridging.

A Wrapped token contract (WrappedToken) deployed on Goerli.

A Bridge contract on Goerli (BridgeB) to mint wrapped tokens after locking.
