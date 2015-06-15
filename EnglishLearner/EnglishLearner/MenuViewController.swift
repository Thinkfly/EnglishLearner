//
//  MenuViewController.swift
//  EnglishLearner
//
//  Created by app on 15/6/9.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController, UITableViewDataSource {
    
    let IDENTIFIER_TABLEVIEW_BOOK = "IDENTIFIER_TABLEVIEW_BOOK"
    let IDENTIFIER_TABLEVIEW_MEDIA = "IDENTIFIER_TABLEVIEW_MEDIA"
    
    let tableView : UITableView = UITableView()
//    var mediaTableView : UITableView = UITableView()
    let getDataButton : UIButton = UIButton()
    
    var bookArray : NSMutableArray?
    var mediaArray : NSMutableArray?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        
        println("宽:" + String(stringInterpolationSegment: Constant.screenWidth))
        println("高:" + String(stringInterpolationSegment: Constant.screenHeight))
        
        let buttonHeight : CGFloat = 50
        let spHeight : CGFloat = 20
        
        let tableHeight = (Constant.screenHeight - spHeight * 3 - buttonHeight) / 2
        
        self.view.addSubview(getDataButton)
        getDataButton.backgroundColor = UIColor(red: CGFloat(3.0 / 255.0), green: CGFloat(192.0 / 255.0), blue: CGFloat(198.0 / 255.0), alpha: CGFloat(1.0))
        getDataButton.titleLabel?.textColor = UIColor.whiteColor()
        getDataButton.setTitle("刷   新", forState: UIControlState.Normal)
        getDataButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.centerX.equalTo(self.view)
            make.height.equalTo(50)
        }
        getDataButton.addTarget(self, action: Selector("getData:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.brownColor()
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(20)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.getDataButton.snp_top).offset(-20)
        }
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
//        self.view.addSubview(mediaTableView)
//        mediaTableView.backgroundColor = UIColor.orangeColor()
//        mediaTableView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(bookTableView.snp_bottom).offset(20)
//            make.left.equalTo(self.view).offset(0)
//            make.right.equalTo(self.view).offset(0)
//            make.height.equalTo(tableHeight)
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
    
    //获取本地数据按钮
    @IBAction func getData(sender : UIButton){
        //self.getData()
        self.getDeviceResourceData("")
    }
    
    //获取本地数据
    func getData() {
        
        
        
        
    }
    
    func getDeviceResourceData(fileName : String) {
        let pathArray : NSArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        ///Users/app/Library/Developer/CoreSimulator/Devices/9AE9A419-D4B2-4BD2-96A2-6C432D2BDFB7/data/Containers/Data/Application/58585DCF-B506-4EAC-976C-91675CE0245E/Documents
        if (0 < pathArray.count) {
            var pathStr : String = pathArray.objectAtIndex(0) as! String
            
            if (!fileName.isEmpty) {
                pathStr = "\(pathStr)/\(fileName)"
            }
            
            let fileManager : NSFileManager = NSFileManager.defaultManager()
            
            let tempFileList : NSArray = NSArray(array: fileManager.contentsOfDirectoryAtPath(pathStr, error: nil)!)
            
            for name in tempFileList {
                let filePath = "\(pathStr)/\(name)"
                
                var isDir = ObjCBool(false)
                
                var isExist : Bool = fileManager.fileExistsAtPath(filePath, isDirectory: &isDir)
                
                if (isExist && isDir) {
                    self.getDeviceResourceData(name as! String)
                } else {
                    switch (filePath.pathExtension) {
                    case "pdf" :
                        self.bookArray?.addObject(filePath)
                        break
                        
                    case "mp3" :
                        self.mediaArray?.addObject(filePath)
                        break
                        
                    default:
                        break
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (0 == section) {
            return "图书列表"
        } else {
            return "音频列表"
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (0 == section) {
            return 1
        } else {
            return 1
        }
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : AnyObject? = nil
        
        if (0 == indexPath.section) {
            
            cell = tableView.dequeueReusableCellWithIdentifier(IDENTIFIER_TABLEVIEW_BOOK)
            
            var bookTableViewCell : BookTableViewCell!
            
            if let tableViewCell : AnyObject = cell {
                
                bookTableViewCell = tableViewCell as! BookTableViewCell
                
            } else {
                
                bookTableViewCell = BookTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: IDENTIFIER_TABLEVIEW_BOOK)
                
                cell = bookTableViewCell
                
            }
            
            bookTableViewCell.label.text = "你好"
            
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier(IDENTIFIER_TABLEVIEW_BOOK)
            
            var bookTableViewCell : BookTableViewCell!
            
            if let tableViewCell : AnyObject = cell {
                
                bookTableViewCell = tableViewCell as! BookTableViewCell
                
            } else {
                
                bookTableViewCell = BookTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: IDENTIFIER_TABLEVIEW_BOOK)
                
                cell = bookTableViewCell
                
            }
            
            bookTableViewCell.label.text = "我好"
            
        }
        
        return cell as! UITableViewCell
    }

}
