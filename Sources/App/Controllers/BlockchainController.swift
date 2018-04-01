//
//  BlockchainController.swift
//  App
//
//  Created by Developer on 1/12/1397 AP.
//

import Foundation
import Vapor
import HTTP


class BlockchainController {
    
    private (set) var drop : Droplet
    private (set) var blockchainService : BlockchainService
    
    
    
    init(drop: Droplet) {
        self.drop = drop
        self.blockchainService = BlockchainService()
        setupRoutes()
    }
    
    
    private func setupRoutes(){
        self.drop.get("blockchain") { request in
            let blockchain = self.blockchainService.getBlockchain()
            return try! JSONEncoder().encode(blockchain)
        }
        
        self.drop.post("mine") { request in
            if let transaction = Transaction(request: request) {
                let block = self.blockchainService.getMinedBlockchain(transaction: [transaction])
               // block.addTransaction(transaction: transaction)
                return try! JSONEncoder().encode(block)
            }
            
            return try! JSONEncoder().encode(["message":"Something went wrong!"])
            
        }
    }
    
}




























