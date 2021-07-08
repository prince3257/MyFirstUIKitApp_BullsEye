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
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") //use Image Literal to pick the icon directly
        //let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right:14)
    
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
    
    @IBAction func startOver(){
        round = 0
        score = 0
        startNewRound()

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

