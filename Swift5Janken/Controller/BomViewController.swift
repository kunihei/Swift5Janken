//
//  BomViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/08.
//

import UIKit

class BomViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var bomBtn1: UIButton!
    @IBOutlet weak var bomBtn2: UIButton!
    @IBOutlet weak var bomBtn3: UIButton!
    @IBOutlet weak var bomBtn4: UIButton!
    @IBOutlet weak var bomBtn5: UIButton!
    @IBOutlet weak var bomBtn6: UIButton!
    @IBOutlet weak var bomBtn7: UIButton!
    @IBOutlet weak var bomBtn8: UIButton!
    @IBOutlet weak var bomBtn9: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var count = Int()
    var btnArray:[UIButton] = [UIButton]()
    var countDownNum = 3
    var timer:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "残り時間：\(countDownNum)"
        resultLabel.layer.cornerRadius = 5.0
        resultLabel.clipsToBounds = true
        backBtn.layer.cornerRadius = 10.0
        startBtn.layer.cornerRadius = 10.0
        resetBtn.layer.cornerRadius = 10.0
        btnArray = [bomBtn1,bomBtn2,bomBtn3,bomBtn4,bomBtn5,bomBtn6,bomBtn7,bomBtn8,bomBtn9]
        for i in 0...8{
            btnArray[i].isEnabled = false
        }
        resetBtn.isHidden = true
    }
    
    func result(){
        for i in 0...8{
            if i != count - 1{
                btnArray[i].isHidden = true
            }
        }
    }
    
    
    @IBAction func bomBtn(_ sender: Any) {
        let intArray:[Int] = [1,2,3,4,5,6,7,8,9]
        for r in 0...8{
            if (sender as AnyObject).tag == intArray[r]{
                
                if (sender as AnyObject).tag == count{
                    resultLabel.text = "アウト"
                    resultLabel.backgroundColor = .red
                    (sender as AnyObject).setTitle("💥", for: .normal)
                    timer.invalidate()
                    result()
                }else{
                    resultLabel.text = "セーフ"
                    resultLabel.backgroundColor = .blue
                    countDownNum = 4
                    for e in 0...8{
                        if e == (sender as AnyObject).tag - 1{
                            btnArray[e].isHidden = true
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        for i in 0...8{
            btnArray[i].isHidden = false
            btnArray[i].isEnabled = false
            btnArray[i].setTitle("💣", for: .normal)
        }
        countDownNum = 3
        timer.invalidate()
        resultLabel.text = "結果"
        timerLabel.text = "残り時間：\(countDownNum)"
        resultLabel.backgroundColor = .systemBlue
        resetBtn.isHidden = true
        startBtn.isHidden = false
    }
    
    @IBAction func start(_ sender: Any) {
        for i in 0...8{
            btnArray[i].isEnabled = true
        }
        timer = Timer.scheduledTimer(timeInterval: 0.9, target:self, selector:#selector(countDown), userInfo:nil, repeats:true)
        count = Int(arc4random_uniform(9) + 1)
        resetBtn.isHidden = false
        startBtn.isHidden = true
        
    }
    
    @objc func countDown(){
            countDownNum -= 1
            if(countDownNum > 0) {
                timerLabel.text = "残り時間：\(countDownNum)"
            } else {
                timerLabel.text = "残り時間：0"
                resultLabel.text = "時間切れ‼︎"
                resultLabel.backgroundColor = .systemRed
                for i in 0...8{
                    btnArray[i].isEnabled = false
                    btnArray[i].setTitle("💥", for: .normal)
                }
                timer.invalidate()
            }
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
