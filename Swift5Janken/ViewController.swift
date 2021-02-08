//
//  ViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/01/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var par: UIButton!
    @IBOutlet weak var choki: UIButton!
    @IBOutlet weak var goo: UIButton!
    @IBOutlet weak var janken: UIButton!
    @IBOutlet weak var countBtn: UIButton!
    @IBOutlet weak var bomButton: UIButton!
    
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bomButton.layer.cornerRadius = 10.0
        countBtn.layer.cornerRadius = 10.0
        par.isEnabled = false
        choki.isEnabled = false
        goo.isEnabled = false
        
        for i in 0..<3{
            print(i)
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
        
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        
        count += 1
        if count > 2{
            count = 0
        }
        imageView.image = imageArray[count]
        
    }
    
    enum actionTag: Int {
        case action1 = 1
        case action2 = 2
        case action3 = 3
    }
    
    @IBAction func janken(_ sender: Any) {
        
        janken.isHidden = true
        par.isEnabled = true
        choki.isEnabled = true
        goo.isEnabled = true
        startTimer()
        
    }
    
    @IBAction func jankenBtn(_ sender: Any) {
        
        janken.isHidden = false
        if let button = sender as? UIButton {
            if let tag = actionTag(rawValue: button.tag) {
                switch tag {
                case .action1:
                    print(par.tag)
                    print(count)
                    if 0 == count{
                        print("勝ち")
                        imageView.image = UIImage(named: "win")
                    } else if 1 == count{
                        print("負け")
                        imageView.image = UIImage(named: "lose")
                    } else if 2 == count{
                        print("あいこ")
                        imageView.image = UIImage(named: "drow")
                    }
                    choki.isEnabled = false
                    goo.isEnabled = false
                    timer.invalidate()
                    
                case .action2:
                    print(choki.tag)
                    if 2 == count{
                        print("勝ち")
                        imageView.image = UIImage(named: "win")
                    } else if 1 == count{
                        print("あいこ")
                        imageView.image = UIImage(named: "drow")
                    } else if 0 == count{
                        print("負け")
                        imageView.image = UIImage(named: "lose")
                    }
                    goo.isEnabled = false
                    par.isEnabled = false
                    timer.invalidate()
                    
                case .action3:
                    print(goo.tag)
                    if 1 == count{
                        print("勝ち")
                        imageView.image = UIImage(named: "win")
                    } else if 2 == count{
                        print("負け")
                        imageView.image = UIImage(named: "lose")
                    } else if 0 == count{
                        print("あいこ")
                        imageView.image = UIImage(named: "drow")
                    }
                    choki.isEnabled = false
                    par.isEnabled = false
                    timer.invalidate()
                    
                }
            }
        }
    }
    
    @IBAction func jamp(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func bomBtn(_ sender: Any) {
        performSegue(withIdentifier: "bom", sender: nil)
    }
    
    
}

