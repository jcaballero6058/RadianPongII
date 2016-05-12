//
//  GameScene.swift
//  RadianPongII
//
//  Created by John G. Caballero on 5/10/16.
//  Copyright (c) 2016 John G. Caballero. All rights reserved.
//

import SpriteKit
import CoreMotion


class GameScene: SKScene
{
    
    var player = SKSpriteNode()
    var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    
    override func didMoveToView(view: SKView)
    {
        /* Setup your scene here */
        

        player = SKSpriteNode(imageNamed: "blueship1")
        player.position = CGPointMake(frame.size.width/3, frame.size.height/3)
        self.addChild(player)
        
        
    
        
        if motionManager.accelerometerAvailable == true
        {
            
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:
                {
                data, error in
                
                var currentX = self.player.position.x
                
                if data!.acceleration.x < 0
                {
                    self.destX = currentX + CGFloat(data!.acceleration.x * 100)
                }
                    
                else if data!.acceleration.x > 0
                {
                    self.destX = currentX + CGFloat(data!.acceleration.x * 100)
                }
                
            
            
                })
            
        
        }
    
        
        
    }
    
   
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
        
        var action = SKAction.moveToX(destX, duration: 1)
        self.player.runAction(action)
        
    }
        
}
