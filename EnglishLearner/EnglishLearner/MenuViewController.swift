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
        
        bookTableView.backgroundColor = UIColor.brownColor()
        self.view.addSubview(bookTableView)
        bookTableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(20)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.size.height.equalTo(400)
        }
        
//        mediaTableView.backgroundColor = UIColor.orangeColor()
//        mediaTableView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(bookTableView).offset(200)
//        }
//
//        getDataButton.setTitle("刷新数据", forState: UIControlState.Normal)
//        getDataButton.snp_makeConstraints { (make) -> Void in
////            make.bottom.equalTo(self.view).offset(-300)
//            make.center.equalTo(self.view)
//        }
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
