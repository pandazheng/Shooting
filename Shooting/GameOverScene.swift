//
//  GameOverScene.swift
//  Shooting
//
//  Created by pandazheng on 15/7/13.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
  
    init(size: CGSize, won:Bool) {
    
    super.init(size: size)
    
    // 1
    backgroundColor = SKColor.whiteColor()
    
    // 2
    var message = won ? "You Won!" : "You Lose :["
    
    // 3
    let label = SKLabelNode(fontNamed: "Chalkduster")
    label.text = message
    label.fontSize = 40
    label.fontColor = SKColor.blackColor()
    label.position = CGPoint(x: size.width/2, y: size.height/2)
    addChild(label)
    
    // 4
    runAction(SKAction.sequence([
      SKAction.waitForDuration(3.0),
      SKAction.runBlock() {
        // 5
        let reveal = SKTransition.flipHorizontalWithDuration(0.5)
        let scene = GameScene(size: size)
        self.view?.presentScene(scene, transition:reveal)
      }
    ]))
    
    }

  // 6
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view?.presentScene(GameScene(size : view!.bounds.size))
    }
}