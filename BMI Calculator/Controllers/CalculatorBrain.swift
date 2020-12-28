//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by jaime on 12/28/20.
//  Copyright © 2020 JaimeGoB. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    //Variables
    var bmi:BMI?
    
    /*
     * This function is called once the calculate button is pressed:
     * It will immediatlyy assign values for value, advice and color to be
     * used in the getters.
     */
    mutating func calculateBMI(_ height:Float, _ weight:Float){
        //BMI = Weight / (Height ^2)
        let bmiValue = Float(weight) / pow(Float(height), 2.0)
        
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if(bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "Eat a little less!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    //Coalescing operator -> returns default if BMI is nill
    func getBMI() -> String{
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice, sorry."
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}
