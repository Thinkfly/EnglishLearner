//
//  ViewController.swift
//  EnglishLearner
//
//  Created by app on 15/6/9.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let box = UIView()
        box.backgroundColor = UIColor .blueColor()
        self.view.addSubview(box)
        
        box.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.bottom.equalTo(self.view).offset(-20)
            make.right.equalTo(self.view).offset(-20)
        }
        
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

