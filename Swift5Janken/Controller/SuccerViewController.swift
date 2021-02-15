//
//  SuccerViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/11.
//

import UIKit
import SpriteKit

let w = UIScreen.main.bounds.size.width
let h = UIScreen.main.bounds.size.height

class SuccerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sv = SKView(frame: CGRect(x: 0, y: 0, width: w, height: h))
        view.addSubview(sv)
        let ss = GameScene(size: sv.frame.size)
        ss.backgroundColor = .green
        sv.presentScene(ss)

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class GameScene: SKScene{
    
    let sb = SKLabelNode(text: "⚽️")
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.2)
        sb.fontSize = 50
        sb.position = CGPoint(x: frame.midX, y: CGFloat(h - 100))
        sb.physicsBody = SKPhysicsBody(circleOfRadius: sb.frame.width / 2)
        sb.physicsBody?.isDynamic = true
        sb.physicsBody?.restitution = 0.8
        addChild(sb)
        let g = SKLabelNode(text: "🥅")
        g.fontSize = 150
        g.position = CGPoint(x: frame.midX, y: CGFloat(h - 120))
        g.physicsBody = SKPhysicsBody(circleOfRadius: 1)
        g.physicsBody?.isDynamic = false
        addChild(g)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sb.physicsBody?.applyImpulse(CGVector(dx: Double(arc4random_uniform(400)) - 200.0, dy: Double(arc4random_uniform(400)) - 200.0))
    }
    
}
