//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightsliderScroll(_ sender: UISlider) {
        heightLabel.text = String(round(sender.value*100)/100)
        heightLabel.text! += "m"
        
        
        
    }
    
    
    @IBAction func weightSliderScroll(_ sender: UISlider) {
        
        weightLabel.text = String(Int(sender.value))
        weightLabel.text! += "Kg"
        
        
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value,weight: weightSlider.value)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                 sender: Any?){
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultViewController
            destination.bmiV = calculatorBrain.getBMIValue()
            destination.advice = calculatorBrain.getAdvice()
            destination.color = calculatorBrain.getColor()
            
            
            
        }
        
    }
}

