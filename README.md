# Smart Contracts with [Solidity](https://github.com/ethereum/solidity)
Using Solidity Smart Contracts to automate employee profit and equity sharing

## Equal Profit Splitter

This contract takes ether in and divides it equally among three seperate associate or employee addresses.

![Associate Profit Splitter Contract in action - screen recording](/Screenshots/AssociateProfitSplitter.gif)

## Tiered Profit Splitter

This contract takes ether in and divides it among three seperate addresses according to rules set in the contract.
In this case one address receives 60% of the ether received, the second address gets 25% and the third gets 15% with any calculable remainder going to the first address.

![Tiered Profit Splitter Contract in action - screen recording](/Screenshots/TieredProfitSplitter.gif)

## Deferred Equity Plan

This contract defines a set of shares *(1000)* and an annual distribution rate *(250)* then checks if 365 days has passed and distributes the allotted number of shares.

![Deferred Equity Plan Contract in action - screen recording](/Screenshots/DeferredEquityPlan.gif)
