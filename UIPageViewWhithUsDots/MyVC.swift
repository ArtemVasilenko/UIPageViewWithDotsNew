//
//  MyVC.swift
//  UIPageViewWhithUsDots
//
//  Created by Артем on 3/28/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MyVC: UIViewController {
    
    
    @IBOutlet weak var dots: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let myPageVC = segue.destination as? MyPageViewController
            else { return }
    
        myPageVC.myDelegete = self
    }
}

extension MyVC: MyPageViewControllerDelegate {
    func myPageViewController(myPageViewController: MyPageViewController, didUpdatePageCount count: Int) {
        dots.numberOfPages = count
    }
    
    func myPageViewController(myPageViewController: MyPageViewController, didUpdatePageIndex index: Int) {
        dots.currentPage = index
    }
    
    
    
}
