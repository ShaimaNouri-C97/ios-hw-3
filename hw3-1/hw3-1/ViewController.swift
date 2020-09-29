//
//  ViewController.swift
//  hw3-1
//
//  Created by Shaima Nouri on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
        let weight = Double(weightField.text!)
        let height = Double(heightField.text!)
        let bmi = calculateBMI (weight: weight!, height: height!)

        resultLabel.text! = bmi

    }
    
    func calculateBMI(weight: Double, height: Double) -> String {
        let BMI = weight / (height * height)

        if BMI < 18.5 {
            return ("Thin")
        }
        else if BMI > 30.0 {
            return ("Normal")
        }
        
        else {
               return "Fat"
        }

    }

    
}

