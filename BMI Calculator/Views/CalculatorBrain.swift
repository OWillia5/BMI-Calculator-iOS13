//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ope Williams on 6/23/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?
    
    // how to grab the height and weight values from calculate view controller
    mutating func calculateBMI(_ height: Float, _ weight: Float){
       let bmiValue = weight / (height * height)
        
        let color1 = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        let color2 = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        let color3 = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!",color:color1 )
        }
        else if bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!",color:color2)
        }
        else if bmiValue > 24.9{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!",color:color3 )
        }
    }
    
    func getBMIValue () -> String{
        let bmiValueToOneDp = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiValueToOneDp
    }
    
    func getAdvice () -> String{
        return bmi?.advice ?? "No advice"
    }
    
    func getColor () -> UIColor{
        return bmi?.color ?? UIColor.clear
    }
    
}
