//
//  Rainfall.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/08/2023.
//

import SwiftUI
import SpriteKit

class RainFall: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        anchorPoint = CGPoint(x: 0.5, y: 1)
        
        // bg Color...
        backgroundColor = .clear
        
        // creating node and adding to scene...
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        
        // Full width...
        node.particlePositionRange.dx = UIScreen.main.bounds.width
        
        node.particleColor = .white
        
    }
}

// Next Rain Fall Landing Scene...
class RainFallLanding: SKScene{
    override func sceneDidLoad() {
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        // anchor point..
        let height = UIScreen.main.bounds.height
        // getting percentage by eminiationg postion range....
        anchorPoint = CGPoint(x: 0.5, y: (height - 5) / height)
        
        // bg Color...
        backgroundColor = .clear
        
        // creating node and adding to scene...
        let node = SKEmitterNode(fileNamed: "RainFallLanding.sks")!
        addChild(node)
        
        // Removed for card padding...
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
        
        node.particleColor = .white
        
    }
}
