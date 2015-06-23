//
//  ViewController.swift
//  EnglishLearner
//
//  Created by app on 15/6/9.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var menuViewController: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = true
        
        menuViewController = MenuViewController()
        
        self.view.addSubview(menuViewController.view)
        
        menuViewController.setContainerWidth(100)
        
        let button = UIButton()
        button.addTarget(self, action: Selector("buttonClick"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonClick(){


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

