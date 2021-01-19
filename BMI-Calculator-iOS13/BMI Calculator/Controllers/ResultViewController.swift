//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Azeem Lodhi on 16/12/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiV:String?
    var color:UIColor?
    var advice:String?
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiV
        view.backgroundColor = color
        adviceLabel.text = advice
        
        
        
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
        
    }
    

}
