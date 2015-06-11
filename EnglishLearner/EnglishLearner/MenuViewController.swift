//
//  MenuViewController.swift
//  EnglishLearner
//
//  Created by app on 15/6/9.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    var bookTableView : UITableView = UITableView()
    var mediaTableView : UITableView = UITableView()
    var getDataButton : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        
        println("宽:" + String(stringInterpolationSegment: Constant.screenWidth))
        println("高:" + String(stringInterpolationSegment: Constant.screenHeight))
        
        let buttonHeight : CGFloat = 50
        let spHeight : CGFloat = 20
        
        let tableHeight = (Constant.screenHeight - spHeight * 3 - buttonHeight) / 2
        
        self.view.addSubview(bookTableView)
        bookTableView.backgroundColor = UIColor.brownColor()
        bookTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(20)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.height.equalTo(tableHeight)
        }
        
        self.view.addSubview(mediaTableView)
        mediaTableView.backgroundColor = UIColor.orangeColor()
        mediaTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(bookTableView.snp_bottom).offset(20)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.height.equalTo(tableHeight)
        }

        self.view.addSubview(getDataButton)
        getDataButton.backgroundColor = UIColor.greenColor()
        getDataButton.titleLabel?.textColor = UIColor.whiteColor()
        getDataButton.setTitle("刷   新", forState: UIControlState.Normal)
        getDataButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func getData(sender : UIButton){
        
    }

}
