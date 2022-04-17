//
//  File.swift
//  SoundofCoffee
//
//  Created by Mariana Beilune Abad on 16/04/22.
//

import Foundation
import SwiftUI
import SpriteKit

class BeanChoiceGameScene: SKScene {
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        backgroundColor = SKColor.init(named: "fundo")!
        setup()
    }
    
    func setup() {
        removeAllChildren()
        
        let text = newLabel(
            text: "Whether it's for digestion, lightening the spirit, staving off sleep or just soothing the soul, coffee originates from the Ethiopian highlands. The name comes from the Arabic word *qahwa,* which means wine.\nA legend tells that a shepherd named Kaldi observed the behavior of his sheep after ingesting the leaves and fruits of the coffee tree, they were jumping and were able to travel long distances after consumption.",
            color: .black,
            fontSize: 35,
            x: self.size.width/2,
            y: (self.size.height/2) - 70)
        
        text.horizontalAlignmentMode = .left
        text.startTyping(15, completion: nil)
    }
    
    func newLabel(text: String, color: SKColor, fontSize: CGFloat, x: CGFloat, y: CGFloat) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "Helvetica")
        label.text = text
        label.color = color
        label.fontSize = fontSize
        label.name = "TextLabel"
        label.position = CGPoint(x: x, y: y)
        
        addChild(label)
        return label
    }
}
