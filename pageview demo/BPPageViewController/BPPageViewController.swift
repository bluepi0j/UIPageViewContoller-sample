//
//  BPPageViewController.swift
//  pageview demo
//
//  Created by Vic Wang on 2016-09-26.
//  Copyright © 2016 bluepi0j. All rights reserved.
//

import UIKit


public class BPPageViewController: UIPageViewController {
    
    
    /// Return if first page and last page's bounce is disabled
    public var firstLastPageBounceDisabled = false
    
    /// Index of start page
    public var startPage = 0
    
    /// All the ViewController in the page view
    lazy var pages = [UIViewController]()
    
    /// current page index
    public fileprivate(set) var currentPageIndex: Int?
    
}

// MARK: - Public function
extension BPPageViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigateToPage(startPage, animated: false)

    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    public convenience init(allViewControllers viewControllers: [UIViewController], transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
////        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
//    }
}

// MARK: - UIPageViewControllerDataSource
extension BPPageViewController: UIPageViewControllerDataSource {
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return self.pages[0]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return self.pages[0]
    }
    
    public func prevPage() {
        if self.currentPageIndex! > 0 {
            self.navigateToPage(self.currentPageIndex! - 1 , animated: true)
        }
    }
    
    public func nextPage() {
        if self.currentPageIndex! < self.pages.count - 1 {
            self.navigateToPage(self.currentPageIndex! + 1, animated: true)
        }
    }

}

// MARK: - UIPageViewControllerDelegate
extension BPPageViewController: UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
}

extension BPPageViewController {
    private func viewControllerAt(_ index: Int) -> UIViewController {
        return self.pages[index];
    }
    
    fileprivate func navigateToPage(_ index: Int, animated: Bool) {
        let direction: UIPageViewControllerNavigationDirection = (index > self.currentPageIndex!) ? .forward : .reverse

        self .setViewControllers([self.pages[index]], direction: direction, animated: animated, completion: nil)
        self.currentPageIndex = index
    }
}
