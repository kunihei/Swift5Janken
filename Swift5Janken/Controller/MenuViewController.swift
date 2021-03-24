//
//  MenuViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/08.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    @IBOutlet weak var janBtn: UIButton!
    @IBOutlet weak var kazuButton: UIButton!
    @IBOutlet weak var bomButton: UIButton!
    
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        janBtn.layer.cornerRadius = 5.0
        kazuButton.layer.cornerRadius = 5.0
        bomButton.layer.cornerRadius = 5.0
        
        let path = Bundle.main.path(forResource: "kurage", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            
            self.player.seek(to: .zero)
            self.player.play()
            
        }
        self.player.play()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.player.play()
    }
    
    @IBAction func jankenBtn(_ sender: Any) {
        performSegue(withIdentifier: "Succer", sender: nil)
        player.pause()
    }
    
    @IBAction func kazuBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "kazu", sender: nil)
        player.pause()
        
    }
    
    @IBAction func bomBtn(_ sender: Any) {
        performSegue(withIdentifier: "bom", sender: nil)
        player.pause()
    }
    
    @IBAction func quizBtn(_ sender: Any) {
        performSegue(withIdentifier: "quiz", sender: nil)
        player.pause()
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
