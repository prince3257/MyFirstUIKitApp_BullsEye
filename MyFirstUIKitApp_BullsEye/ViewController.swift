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
    var score:Int = 0
    var round:Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var showtarget: UILabel!
    @IBOutlet weak var showscore: UILabel!
    @IBOutlet weak var showround: UILabel!

    
    override func viewDidLoad() { //is called as soon as ViewController loads its interface
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }
    
    //to tell the swift to connect with something in storyboard.
    @IBAction func showAlert() {
        
        let difference = abs(targetValue-currentValue)
        var point = 100 - difference
       
        score += point
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            point += 100
        }else if difference < 5{
            title = "You almost had it"
            if difference == 1{
                point += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close!"
        }
        
        let message = "You scored \(point) points "
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
            
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
   
    func updateLabels(){
        showtarget.text = String(targetValue)
        showscore.text = String(score)
        showround.text = String(round)
    }
    

}

