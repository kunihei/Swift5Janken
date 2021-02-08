//
//  MenuViewController.swift
//  Swift5Janken
//
//  Created by 祥平 on 2021/02/08.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
