//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by jaime on 12/28/20.
//  Copyright © 2020 JaimeGoB. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    var bmiValue:String?
    
    //Values to update GUI
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        //Going back to previous view.
        self.dismiss(animated: true, completion: nil)
    }
}
