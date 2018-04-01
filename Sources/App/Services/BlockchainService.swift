//
//  BlockchainService.swift
//  App
//
//  Created by Developer on 1/12/1397 AP.
//

import Foundation


class BlockchainService {
    
    private (set) var blockchain : Blockchain!
    
    init() {
        self.blockchain = Blockchain(genesisBlock: Block())
    }
    
    func getMinedBlockchain(transaction:[Transaction]) -> Block {
        let block = self.blockchain.getNextBlock(transactions: transaction)
        self.blockchain.addBlock(block)
        return block
    }
    
    func getBlockchain() -> Blockchain {
        return self.blockchain
    }
}
