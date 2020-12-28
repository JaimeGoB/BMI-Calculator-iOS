//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by jaime on 12/28/20.
//  Copyright © 2020 JaimeGoB. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
