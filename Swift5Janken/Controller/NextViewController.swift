//
//  NextViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/06.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var timer = Timer()
    var count = Int()
    var count2 = Int()
    var countArray = [Int]()
    let randomInt = Int.random(in: 1..<100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.layer.cornerRadius = 10.0
        startBtn.layer.cornerRadius = 20.0
        stopBtn.layer.cornerRadius = 20.0
        
        stopBtn.isHidden = true
        for i in 0..<99{
            count = i + 1
            countArray.append(count)
        }

    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        
        count2 += 1
        if count2 > 98{
            count2 = 0
        }
        countLabel.text = String(countArray[count2])
        
    }
    
    
    @IBAction func start(_ sender: Any) {
        
        stopBtn.isHidden = false
        startBtn.isHidden = true
        count2 = 0
        startTimer()
        
    }
    @IBAction func stop(_ sender: Any) {
        
        startBtn.isHidden = false
        stopBtn.isHidden = true
        timer.invalidate()
        countLabel.text = String(countArray.randomElement()!)
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
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
