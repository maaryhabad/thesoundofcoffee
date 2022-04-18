//
//  File.swift
//  SoundofCoffee
//
//  Created by Mariana Beilune Abad on 15/04/22.
//

import SwiftUI
import SpriteKit

class IntroGameScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = SKColor.init(named: "fundo")!
        
    }
    
    func setup() {
        removeAllChildren()
        let screenHeight = self.size.height
        let screenWidth = self.size.width
        // Bola 1: x - radius y self.size.height/2
        newCircleNode(radius: 10, x: 50, y: screenHeight/2, color: .black)
        newCircleNode(radius: 10, x: screenWidth-50, y: screenHeight/2, color: .black)
        
        let recButton = newRecNode(radius: 25, x: screenWidth/2, y: 170, color: .red)
        recButton.name = "recButton"
        let array: [SKNode] = [recButton]
        
        animateNodes(array)
        
        makeSprite(symbolName: "cup.and.saucer.fill")
        newLabel(text: "The sound of coffee", color: SKColor.init(named: "icones")!, fontSize: 55, x: (self.size.width/2), y: (self.size.height/2) - 70)
        
        newLabel(text: "REC", color: SKColor.red, fontSize: 35, x: self.size.width/2, y: 100)
        
    }

    override func didChangeSize(_ oldSize: CGSize) {
        super.didChangeSize(oldSize)
        setup()
        makeSprite(symbolName: "cup.and.saucer.fill.svg")
    }
    
    //TODO: ver com o Renan como tirar esse código daqui!!!!! (Extension, ou outra classe?)
    func newRecNode(radius: CGFloat, x: CGFloat, y: CGFloat, color: UIColor) -> SKNode {
        let node = SKShapeNode(circleOfRadius: radius)
        node.fillColor = color
        
        node.position = CGPoint(x: x, y: y)
        addChild(node)
        return node
    }
    
    func newCircleNode(radius: CGFloat, x: CGFloat, y: CGFloat, color: UIColor) {
        let node = SKShapeNode(circleOfRadius: radius)
        node.fillColor = color
        
        node.position = CGPoint(x: x, y: y)
        addChild(node)
    }
    
    func makeSprite(symbolName: String) {
        let screenHeight = self.size.height
        let screenWidth = self.size.width
        
        let iconNode = SKSpriteNode(imageNamed: "cup.and.saucer.fill")
        
        iconNode.size = CGSize(width: 130, height: 100)
        iconNode.name = "IconNode"
        iconNode.position = CGPoint(x: screenWidth/2, y: screenHeight/2 + 50)
        addChild(iconNode)
        
    }

    func newLabel(text: String, color: SKColor, fontSize: CGFloat, x: CGFloat, y: CGFloat) {
        let label = SKLabelNode(fontNamed: "Helvetica")
        label.text = text
        label.color = color
        label.fontSize = fontSize
        label.name = "TextLabel"
        label.position = CGPoint(x: x, y: y)
        
        addChild(label)
    }
    
    func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            let delayAction = SKAction.wait(forDuration: TimeInterval(index) * 0.2)
            
            let scaleUpAction = SKAction.scale(to: 1.5, duration: 0.3)
            let scaleDownAction = SKAction.scale(to: 1.0, duration: 0.3)
            
            let waitAction = SKAction.wait(forDuration: 0.5)
            
            let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, waitAction])
            
            let repeatAction = SKAction.repeatForever(scaleActionSequence)
            
            let actionSequence = SKAction.sequence([delayAction, repeatAction])
            
            node.run(actionSequence)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            if node.name == "TextLabel" {
                print("No texto")
            }
            if node.name == "recButton" {
                print("No REC")
                let gameScene = SKScene(fileNamed: "BeanChoiceGameScene")
                self.view?.presentScene(gameScene)
            }
        }
    }
    
}
