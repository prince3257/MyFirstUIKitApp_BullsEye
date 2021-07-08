//
//  AboutAuthorViewController.swift
//  MyFirstUIKitApp_BullsEye
//
//  Created by 李 寧珩 on 2021/7/8.
//

import UIKit
import WebKit

class AboutAuthorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "Daniel", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }

    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }

   
}
