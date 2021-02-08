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
    
    var count = arc4random_uniform(9) + 1
    var btnArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.layer.cornerRadius = 10.0
        resetBtn.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    func result(){
        btnArray = [bomBtn1,bomBtn2,bomBtn3,bomBtn4,bomBtn5,bomBtn6,bomBtn7,bomBtn8,bomBtn9]
        for i in 0...8{
            if i != count - 1{
                btnArray[i].isHidden = true
            }
        }
    }
    
    enum actionTag: Int {
        case action1 = 1
        case action2 = 2
        case action3 = 3
        case action4 = 4
        case action5 = 5
        case action6 = 6
        case action7 = 7
        case action8 = 8
        case action9 = 9
    }
    
    @IBAction func bomBtn(_ sender: Any) {
        
        if let button = sender as? UIButton {
            if let tag = actionTag(rawValue: button.tag) {
                switch tag {
                case .action1:
                    if bomBtn1.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn1.isHidden = true
                    }
                    
                case .action2:
                    if bomBtn2.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn2.isHidden = true
                    }
                    
                case .action3:
                    if bomBtn3.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn3.isHidden = true
                    }
                    
                case .action4:
                    if bomBtn4.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn4.isHidden = true
                    }
                case .action5:
                    if bomBtn5.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn5.isHidden = true
                    }
                case .action6:
                    if bomBtn6.tag == count{
                        resultLabel.text = "当たり"
                        result()
                        
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn6.isHidden = true
                    }
                case .action7:
                    if bomBtn7.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn7.isHidden = true
                    }
                case .action8:
                    if bomBtn8.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn8.isHidden = true
                    }
                case .action9:
                    if bomBtn9.tag == count{
                        resultLabel.text = "当たり"
                        result()
                    }else{
                        resultLabel.text = "ハズレ"
                        bomBtn9.isHidden = true
                    }
                }
            }
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        btnArray = [bomBtn1,bomBtn2,bomBtn3,bomBtn4,bomBtn5,bomBtn6,bomBtn7,bomBtn8,bomBtn9]
        for i in 0...8{
            btnArray[i].isHidden = false
        }
        resultLabel.text = "結果"
        count = arc4random_uniform(9) + 1
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
