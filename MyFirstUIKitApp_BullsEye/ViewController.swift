//
//  ViewController.swift
//  MyFirstUIKitApp_BullsEye
//
//  Created by 李 寧珩 on 2021/7/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //to tell the swift to connect with something in storyboard.
    @IBAction func showAlert() {
        
        let alert = UIAlertController(title: "Hello World. :)", message: "This is my first app!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
    }
    
   
    

}

