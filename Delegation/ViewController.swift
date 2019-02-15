//
//  ViewController.swift
//  Delegation
//
//  Created by apple on 15/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let accountInfo = AccountInfo()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        accountInfo.addObserver(self, forKeyPath: "balance", options: [.old, .new ], context: nil)
        
        accountInfo.addObserver(self, forKeyPath: "address", options: [.new ], context: nil)
        
        
        let buttonsView = ButtonsView()
        buttonsView.delegate = self
        buttonsView.backgroundColor = UIColor.red
        buttonsView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300)
        buttonsView.prepareUI()
        self.view.addSubview(buttonsView)
        print(buttonsView)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Value changed: \(keyPath)")
        print(object)
        print(change)
    }
    
    @objc func leftButtonPressed() {
        print("Button PRessed on top of Buttons View")
        accountInfo.balance = 2000
    }
    
    @objc func rightButtonPressed() {
        print("Button PRessed on top of Buttons View")
//        accountInfo.address = "Banglore"
        accountInfo.setValue("Mumbai", forKey: "address")
    }
}

