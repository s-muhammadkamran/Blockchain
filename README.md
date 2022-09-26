# Blockchain

## Tools for Blockchain

- Ethereum Blockchain Clinet (EVM)
- Programming Language Compiler
- Integrated Development Environment (IDE)

### 1. Programming Language

- Solidity (Most famous and the one Ethereum is written in based on C++ and Javascript like syntax)
- Vyper
- LLL
  
### 2. IDEs

- Atom
- VS Code (Supports Solidity)
- Vim Solidity

### 3. Web based IDEs

- REMIX https://remix.ethereum.org/
    - EthFiddle https://ethfiddle.com/
    - Superblocks Lab https://lab.superblocks.com/

### 4 Ethereum EVM 
    	
- Virtual Machine where Ethereum Blockchain can run. This is the only way to access Ethereum network.
- Every node in the Ethereum network must run this.
- This can be a full node or a Light node. Lighter node will only get the latest portion of the current blocks. Or on Demand get what is needed.
- Options for Ethereum EVM are:
	- Cpp-ethereum - Language = C++ 
	- Ethereumjs.lib - Language = Javascript
	- Geth (go-Ethereum) - Language = GO - Get it from https://geth.ethereum.org/
	- Parity - Language = Rust = Get it from https://www.parity.io/ethereum or https://github.com/openethereum/parity-ethereum 
	- Pyethapp - Langugage = Python - Get it from https://github.com/ethereum/pyethapp - Deprecated
	- Trinity - Language = https://github.com/ethereum/trinity

### 5. Your testing environment (Simulated environment)
	
- This is for testing your code, because once you deploy something on the public blockchain, you can't undone it.
- Blocks and Transactions can only be Created. You can't Delete and Update and existing block/transactions.
- Such environment are as follows:
	- Ganache - Get it from https://www.trufflesuite.com/ganache
	- Truffle - Get it from https://www.trufflesuite.com/
	- Cliquebait - A docker instance - Get it from https://github.com/f-o-a-m/cliquebait
	- Local Ethereum Network - Easy to setup scripts to setup pvt blockchain network - Get it from https://github.com/ConsenSysMesh/local_ethereum_network 

### 6. https://etherscan.io/

- Ethereum blockchain explorer. You need Account, this is the Ethereum network.
	
### 7. https://ethereum.org/

- Ethereum Community, Resources, Articles, Guides etc.

### 8. https://myetherwallet.com

- public and Private Keys (Your online Wallet).

### 9. https://andersbrownworth.com/

- Online tool to simulate Hashing, NONCE calculation (Mining) and Blockchaining simulation.
    
## What I am using

- GoEthereum (GETH) an EVM. (https://GETH.Ethereum.org)	  
- GETH is a full Ethereum blockchain node connected to Ethereum main net. You can do the following:
	- Access the complete blockchain
	- Run the EVM
	- Mine ether
	- Create transactions and smart contracts
	- Examine blocks.
- Run it in light mode using command .\geth --syncmode "light"

- Ganache https://www.trufflesuite.com/ganache 
- A Test blockchain EVM to develop and test your smart contract code before deploying.
	- Test blockchain
	- Deploy Contracts and Test locally
	- Develop Applications
	- Run tests
	- Gives you 10 Test Accounts, each with 100 ETH. To test your Apps.

- Truffle Suite https://www.trufflesuite.com/
- Manage Smart Contract Development
	- Compiling
	- Moving / Deployments
	- Testing
	- It's an NPM package (Javascript library) so Install using the below command from the install directory:
		- npm install truffle -g
		- truffle version

- Visual Studio Code IDE
- For writing Smart Contract code in Solidity
- Install Solidity Extension for Visual Studio Code (from Juan Blanco)
	- Auto Code completion
	- Syntax help    

- Solidity compiler (solc) https://github.com/ethereum/solidity
- Solidity software, includes CLI, Compiler to generate Byte Code from Solidity Code.	

- Solidity compiler for Javascript (solcjs) https://github.com/ehtereum/solc-js
- Will be install along with Truffle

- Remix https://remix.ethereum.org/
- Web-based, suite of development tools, includes Solidity compiler.     

- Ethereum Account 
- You create the Ethereum accounts and you get your public/private keys.
- Public key is your address and private key is like the password to access your address. 
- If you lose your private key, you loose all your crypto assets becase:
	- Only way to access Crypto assets is with private key, which can be:
		- Digital Currency
		- Anything else stored on Blockchain
- Hence you use a Crypto Wallet to store and safe guard your Private Keys.

- Crypto Wallet https://metamask.io/
- Wallets can be hot or cold:

- Hot wallets are mostly online accounts, websites etc.
	- Store keys online (software based).
		- Web wallet
			- My Ether Wallet https://www.myetherwallet.com/
			- Coinbase (Exchange/Wallet) https://www.coinbase.com/	
			- Guarda Wallet https://guarda.com/ (Website/Chrome Ext/Mobile/Desktop)				
	- Easily accessible from any where.
	- Can be hacked (Comparatively easily).

- Cold wallets are devices off the network like a USB drive.
	- Keys stored offline.
		- Desktop wallet
			- Exodus
			- Mist
			- Metamask (I am using this) https://metamask.io/
		- Mobile wallet
			- Jaxx
			- Coinomi
			- Bread (BRD)
		- Hardware wallet (USB based)
			- Ledger Nano X
			- Trezor
			- KeepKey
		- Paper based hard copiy of Private Key
			- ETHAddress (Software Repo on Github that generates and print keys)
			- My Ether Wallet (You've the choice to print the keys instead of storing online)
	- More secure but less convenient.
	- Harder to protect from accidents.
