# CharityProtocol

## Abstract
CharityProtocol is an update to the existing product "OnChain CloudFunding by WASM," specifically designed for WaveHack's "Build an Aptos Dapp" challenge. Following a seismic disaster in Japan on New Year's Day 2024, numerous blockchain protocols demonstrated the ability to raise donations via cryptocurrencies successfully. However, challenges related to cryptocurrency donations became evident. CharityProtocol aims to facilitate smooth implementation of donations during crises as a public good using cryptocurrencies.

## Baseline Product
[OnChain CloudFunding by WASM](https://app.akindo.io/communities/0ngdOEZj3iNrQ8v8/products/K8dojE9lMhvQ6djq)

## Application URL
[CloudFunding Frontend](https://wasm-cloudfund-front.vercel.app/) - The updated version on Aptos is under construction.

## Deployed Module on Aptos Testnet
[View Module](https://explorer.aptoslabs.com/account/0x709acdb9471938ee0f0a7d04cde2b3add05c91cc7ace10348e8dad349ce91169/modules/code/message?network=testnet)

## Repository (Smart Contract)
- [Aptos Version (Move)](https://github.com/YasuYasuonFire/charity_contract_aptos)
- [Original WASM Version](https://github.com/YasuYasuonFire/wasm_cloudfund_contract)

## Update (wave1)
- Creation of the base source code for converting from WASM (Rust language) to Move.
- Roadmap description.

## What It Does
CharityProtocol enables transparent on-chain crowdfunding. Users can donate any amount to proposals, and once the required amount is reached, funds can be transferred to the proposer's wallet.

## The Problem It Solves
Traditional crowdfunding faced challenges such as untraceable fund destinations and potential disappearance of donor information. On-chain crowdfunding addresses these issues by ensuring transparency in fund flow and maintaining a permanent record of donor history.

Furthermore, cryptocurrency donations during the Noto Peninsula earthquake highlighted additional challenges:
- Conversion costs for recipients.
- Lack of clear legitimacy proof for recipients.
- Transparency issues regarding fund usage.
- Potential profit realization issues for donors.
- Privacy concerns for donation history.

CharityProtocol aims for frictionless on-chain donations, considering each country's regulatory framework and committing to continuous updates.

## Roadmap
- Seamless migration of code from the WASM contract to Aptos.
- Automatic swapping to stablecoins using external DEX during transfers.
- On-chain KYC for verifying the legitimacy of the recipient's identity.
- Mixing feature to optionally keep transfer history private.

## Challenges, Technologies, and Learning
Describe any challenges encountered, technologies used, the process of building the project, learnings, and future plans for the project.
