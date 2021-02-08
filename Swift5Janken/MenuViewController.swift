//
//  MenuViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/08.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var janBtn: UIButton!
    @IBOutlet weak var kazuButton: UIButton!
    @IBOutlet weak var bomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        janBtn.layer.cornerRadius = 5.0
        kazuButton.layer.cornerRadius = 5.0
        bomButton.layer.cornerRadius = 5.0

    }
    
    @IBAction func jankenBtn(_ sender: Any) {
        performSegue(withIdentifier: "janken", sender: nil)
    }
    
    @IBAction func kazuBtn(_ sender: Any) {
        performSegue(withIdentifier: "kazu", sender: nil)
    }
    
    @IBAction func bomBtn(_ sender: Any) {
        performSegue(withIdentifier: "bom", sender: nil)
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
