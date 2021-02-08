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
    var btnArray:[UIButton] = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 5.0
        resultLabel.clipsToBounds = true
        backBtn.layer.cornerRadius = 10.0
        resetBtn.layer.cornerRadius = 10.0
        btnArray = [bomBtn1,bomBtn2,bomBtn3,bomBtn4,bomBtn5,bomBtn6,bomBtn7,bomBtn8,bomBtn9]
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
                    result()
                }else{
                    resultLabel.text = "セーフ"
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
