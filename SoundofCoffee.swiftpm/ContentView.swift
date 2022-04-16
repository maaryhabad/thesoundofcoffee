import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var scene: SKScene {
        let scene = IntroGameScene()
        scene.scaleMode = .resizeFill
        return scene
    }
        
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
    }
}


