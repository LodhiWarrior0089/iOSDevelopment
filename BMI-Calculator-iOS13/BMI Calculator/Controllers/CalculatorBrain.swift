//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Azeem Lodhi on 17/12/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi :BMI?
    
    
    mutating func calculateBMI(height: Float,weight:Float){
         
        let bmiValue = weight/(height*height)
        
        if bmiValue<18.5{
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), advice: "Eat more SugarDaddy")
        }else if bmiValue>=18.5 && bmiValue<=24.9{
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), advice: "Daily Exercise YAYAYAY")
        }else if bmiValue>24.9{
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.6156862745, green: 0.1019607843, blue: 0.1019607843, alpha: 1) , advice: "Starvation is the Key")
        }
        
        
    }
    func getBMIValue()->String{
        
        
        return String(format:"%.1f",bmi?.value ?? 0.0)
    }
    
    func getColor() -> UIColor? {
        return bmi?.color
    }
    
    func getAdvice()->String?{
        return bmi?.advice
        
        
    }
    
}
