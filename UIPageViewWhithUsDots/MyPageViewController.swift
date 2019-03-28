//
//  MyPageViewController.swift
//  UIPageViewWhithDots
//
//  Created by Артем on 3/26/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    var orderedViewControllers: [UIViewController] = {
        return []
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...Int.random(in: 6...20) {
            createVC(i)
        }
        
        
        if let firstVC = orderedViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        
        self.dataSource = self
    }
    
    func createVC(_ number: Int) {
        
        let myVC = MyViewController()
        
        myVC.myButton.setTitle(String(number), for: .normal)
        myVC.myButton.setTitle(String(number + 1), for: .highlighted)
        
        let btn = UIButton()
        btn.backgroundColor = .rnd()
        btn.frame = CGRect(x: 110, y: 250, width: 100, height: 50)
        btn.setTitle(String(number), for: .normal)
        btn.setTitle(String(number + 1), for: .highlighted)
        btn.setTitleColor(.rnd(), for: .normal)
        btn.setTitleColor(.rnd(), for: .highlighted)
        btn.layer.borderWidth = 5
        btn.layer.borderColor = UIColor.rnd().cgColor
        btn.layer.cornerRadius = 10
        
        myVC.view.backgroundColor = .rnd()
        myVC.view.addSubview(btn)
        
        orderedViewControllers.append(myVC)
        
    }
}

extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        
        let previusIndex = currentIndex - 1
        
        guard previusIndex >= 0 else { return nil }
        guard orderedViewControllers.count > previusIndex else { return nil }
        return orderedViewControllers[previusIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = orderedViewControllers.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        guard nextIndex >= 0 else { return nil }
        guard orderedViewControllers.count > nextIndex else { return nil }
        return orderedViewControllers[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstVC = orderedViewControllers.first,
        let vcIndex = self.orderedViewControllers.firstIndex(of: firstVC)
            else { return 0 }
        
        return vcIndex
    }
    
    
}
