//
//  ViewController.swift
//  HapticTest
//
//  Created by Alexei Baboulevitch on 2016-10-2.
//  Copyright © 2016 Alexei Baboulevitch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var haptics: UIImpactFeedbackGenerator!
    var aSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        haptics = UIImpactFeedbackGenerator(style: .light)
        haptics.prepare()
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(down), for: .touchDown)
        button.addTarget(self, action: #selector(up), for: .touchUpInside)
        button.setTitle("Haptics!", for: .normal)
        button.sizeToFit()
        button.backgroundColor = UIColor.red
        
        let aSwitch = UISwitch()
        aSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aSwitch)
        aSwitch.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        aSwitch.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 8).isActive = true
        
        self.aSwitch = aSwitch
    }

    func down() {
        haptics.prepare()
    }
    
    func up() {
        haptics.impactOccurred()
    }
}

