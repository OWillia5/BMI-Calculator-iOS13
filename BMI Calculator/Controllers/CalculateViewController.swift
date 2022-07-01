//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//  Edited by Opeoluwa Williams

import UIKit

class CalculateViewController: UIViewController {
    
    //var bmiValue = "0.0"
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightSliderLabel: UILabel!
    
    @IBOutlet weak var weightSliderLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //print the value of the slider in 2dp
        //Ex.1
        //print(round(sender.value * 100)/100)
        //Ex.2
        //print(String(format: "%.2f", sender.value))
        heightSliderLabel.text = String(format: "%.2f" + "m", sender.value)
    
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightSliderLabel.text = String(format: "%.0f" + "Kg",sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height, weight)
        
        // triggering the segue - "goToResult" - created in storyboard
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //preparing for our segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            // when the identifier is goToResult the destination for our segue is def the resultviewcontroller
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

