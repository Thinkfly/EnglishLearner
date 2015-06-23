//
//  MenuViewController.swift
//  EnglishLearner
//
//  Created by app on 15/6/9.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let IDENTIFIER_TABLEVIEW_BOOK  = "IDENTIFIER_TABLEVIEW_BOOK"
    let IDENTIFIER_TABLEVIEW_MEDIA = "IDENTIFIER_TABLEVIEW_MEDIA"
    
    
    let containerView : UIView = UIView()
    let tableView : UITableView  = UITableView()
    let getDataButton : UIButton = UIButton()
    
    var bookArray : NSMutableArray  = NSMutableArray()
    var mediaArray : NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        
        println("宽:" + String(stringInterpolationSegment: Constant.screenWidth))
        println("高:" + String(stringInterpolationSegment: Constant.screenHeight))
        println("document:" + FileUtils.getDocumentPath())
        
        self.containerView.frame = self.view.bounds
        self.view.addSubview(self.containerView)
        
        self.containerView.addSubview(getDataButton)
        getDataButton.backgroundColor = UIColor(red: CGFloat(3.0 / 255.0), green: CGFloat(192.0 / 255.0), blue: CGFloat(198.0 / 255.0), alpha: CGFloat(1.0))
        getDataButton.titleLabel?.textColor = UIColor.whiteColor()
        getDataButton.setTitle("刷   新", forState: UIControlState.Normal)
        getDataButton.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.containerView).offset(0)
            make.right.equalTo(self.containerView).offset(0)
            make.bottom.equalTo(self.containerView).offset(0)
            make.centerX.equalTo(self.containerView)
            make.height.equalTo(50)
        }
        getDataButton.addTarget(self, action: Selector("getData:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.containerView.addSubview(tableView)
        //tableView.backgroundColor = UIColor.brownColor()
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.containerView).offset(20)
            make.left.equalTo(self.containerView).offset(0)
            make.right.equalTo(self.containerView).offset(0)
            make.bottom.equalTo(self.getDataButton.snp_top).offset(-20)
        }
        tableView.dataSource      = self
        tableView.delegate        = self
        tableView.tableFooterView = UIView()
        
        getData()
        
    }
    
    func setContainerWidth(width: CGFloat) {
        self.containerView.frame = CGRectMake(0, 0, self.containerView.bounds.width - width, self.containerView.bounds.height)
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

        self.getData()
    }
    
    func getData() {
        
        self.bookArray.removeAllObjects()
        self.mediaArray.removeAllObjects()
        
        self.getDeviceResourceData("")
        
        self.tableView.reloadData()
    }
    
    func getDeviceResourceData(fileName : String) {
        
        var pathStr = FileUtils.getDocumentPath()
        
        if !fileName.isEmpty {
            pathStr = "\(pathStr)/\(fileName)"
        }
        
        let fileManager = NSFileManager.defaultManager()
        
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
                    let entity = ResourceEntity()
                    entity.name = name as? String
                    entity.path = filePath
                    self.bookArray.addObject(entity)
                    break
                    
                case "mp3" :
                    let entity = ResourceEntity()
                    entity.name = name as? String
                    entity.path = filePath
                    self.mediaArray.addObject(entity)
                    break
                    
                default:
                    break
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
            return bookArray.count
        } else {
            return mediaArray.count
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
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
            
            let entity = self.bookArray.objectAtIndex(indexPath.row) as! ResourceEntity
            
            bookTableViewCell.label.text = entity.name
            
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier(IDENTIFIER_TABLEVIEW_BOOK)
            
            var bookTableViewCell : BookTableViewCell!
            
            if let tableViewCell : AnyObject = cell {
                
                bookTableViewCell = tableViewCell as! BookTableViewCell
                
            } else {
                
                bookTableViewCell = BookTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: IDENTIFIER_TABLEVIEW_BOOK)
                
                cell = bookTableViewCell
                
            }
            
            let entity = self.mediaArray.objectAtIndex(indexPath.row) as! ResourceEntity
            
            bookTableViewCell.label.text = entity.name
            
        }
        
        return cell as! UITableViewCell
    }

}
