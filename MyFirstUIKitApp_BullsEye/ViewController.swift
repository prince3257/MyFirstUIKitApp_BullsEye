//
//  ViewController.swift
//  MyFirstUIKitApp_BullsEye
//
//  Created by 李 寧珩 on 2021/7/5.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var showtarget: UILabel!
    
    override func viewDidLoad() { //is called as soon as ViewController loads its interface
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    //to tell the swift to connect with something in storyboard.
    @IBAction func showAlert() {
        
        let message = "The value of the slider is now: \(currentValue)" + "\nThe target valu is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World. :)", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
   
    func updateLabels(){
        showtarget.text = String(targetValue)
        
    }
    

}

