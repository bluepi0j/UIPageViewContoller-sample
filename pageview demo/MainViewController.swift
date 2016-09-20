//
//  MainViewController.swift
//  pageview demo
//
//  Created by bluepi0j on 2016/9/19.
//  Copyright © 2016年 bluepi0j. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var currentIndex: Int = 0
    
    var pageVC: PageContentViewController!
    //http://stackoverflow.com/questions/36029187/nil-check-inside-getter-method-in-swift
    //http://stackoverflow.com/questions/24177908/swift-is-correct-to-use-stored-properties-as-computed-properties
    lazy var firstVC: FirstViewController? =  {
            return self.storyboard!.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController
    }()
    
    lazy var secVC: SecondViewController? = {
                return self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
    }()
    
    lazy var thirdVC: ThirdViewController? = {
        return self.storyboard!.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageVC = self.storyboard!.instantiateViewController(withIdentifier: "pageVC") as! PageContentViewController
        self.pageVC.delegate = self
        self.pageVC.dataSource = self
        
        
        //set first page
        self.nevigateToPage(To: 1, animated: true)
//        self.pageVC.setViewControllers([self.secVC!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        self.pageVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChildViewController(self.pageVC)
        self.view.insertSubview(self.pageVC.view, at: 0)
        self.pageVC.didMove(toParentViewController: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var vc: UIViewController?
        if viewController === self.firstVC {
            vc = self.secVC
            self.currentIndex = 1
            self.pageVC.currentIndex = 1
        } else if viewController === self.secVC {
            vc = self.thirdVC
            self.currentIndex = 2
            self.pageVC.currentIndex = 2
        }
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var vc: UIViewController?
        if viewController === self.secVC {
            vc = self.firstVC
            self.currentIndex = 0
            self.pageVC.currentIndex = 0
        } else if viewController === self.thirdVC {
            vc = self.secVC
            self.currentIndex = 1
            self.pageVC.currentIndex = 1
        }
        return vc

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
            
    }
    
    func nevigateToPage(To index:Int, animated anamited: Bool) {
        
        let direction = (index > currentIndex) ? UIPageViewControllerNavigationDirection.forward : UIPageViewControllerNavigationDirection.reverse;

        // first page
        if index == 0 {
            self.pageVC.setViewControllers([self.firstVC!], direction: direction, animated: anamited, completion: nil)
        //second page
        } else if index == 1 {
            self.pageVC.setViewControllers([self.secVC!], direction: direction, animated: anamited, completion: nil)
        // third page
        } else {
            self.pageVC.setViewControllers([self.thirdVC!], direction: direction, animated: anamited, completion: nil)
        }
        self.pageVC.currentIndex = index;
        self.currentIndex = index;
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
