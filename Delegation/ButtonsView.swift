//
//  ButtonsView.swift
//  Delegation
//
//  Created by apple on 15/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ButtonsView: UIView {
    
    weak var delegate: UIViewController?
    
    func prepareUI() {
        let button = UIButton(frame: CGRect(x: 20, y:40, width: 100, height: 30))
        button.setTitle("Left", for: .normal)
        button.addTarget(delegate, action: #selector(ViewController.leftButtonPressed), for: .touchUpInside)
        self.addSubview(button)
        
        let right = UIButton(frame: CGRect(x: 220, y:40, width: 100, height: 30))
        right.setTitle("Left", for: .normal)
        right.addTarget(delegate, action: #selector(ViewController.rightButtonPressed), for: .touchUpInside)
        self.addSubview(right)
    }
    
    @objc func leftButtonPressed() {
//        print("Left button Pressed")

        if delegate is ViewController {
            (delegate as! ViewController).leftButtonPressed()
        }
    }
}
