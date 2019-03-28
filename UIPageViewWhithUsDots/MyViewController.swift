//
//  MyViewController.swift
//  UIPageViewWhithDots
//
//  Created by Артем on 3/26/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var myButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .rnd()
        btn.frame = CGRect(x: 110, y: 50, width: 100, height: 50)
        btn.setTitle("1", for: .normal)
        btn.setTitle("2", for: .highlighted)
        btn.setTitleColor(.rnd(), for: .normal)
        btn.setTitleColor(.rnd(), for: .highlighted)
        btn.layer.borderWidth = 5
        btn.layer.borderColor = UIColor.rnd().cgColor
        btn.layer.cornerRadius = 10
        
        return btn
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myButton)
        
    }
}


extension UIColor {
    
    class func rnd() -> UIColor {
        
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: .random(in: 0.2...1))
    }
    
}
