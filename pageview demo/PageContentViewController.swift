//
//  PageContentViewController.swift
//  pageview demo
//
//  Created by bluepi0j on 2016/9/19.
//  Copyright © 2016年 bluepi0j. All rights reserved.
//

import UIKit

class PageContentViewController: UIPageViewController, UIScrollViewDelegate {
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in self.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.delegate = self
            }
        }

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        print(scrollView.bounds.size.width)
        if self.currentIndex == 0 && scrollView.contentOffset.y < scrollView.bounds.size.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        } else if self.currentIndex == 2 && scrollView.contentOffset.x > scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if self.currentIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
                scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            } else if currentIndex == 2 && scrollView.contentOffset.x > scrollView.bounds.size.width {
//                scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
            }
    }
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if currentIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
//        } else if currentIndex == totalViewControllers - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
//        }
//    }
//    
//    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if currentIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
//        } else if currentIndex == totalViewControllers - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
