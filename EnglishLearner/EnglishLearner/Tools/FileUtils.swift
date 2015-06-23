//
//  FileUtils.swift
//  EnglishLearner
//
//  Created by app on 15/6/17.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import Foundation
import UIKit

class FileUtils {
    
    class func  getDocumentPath()->String{
        var path:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        return path[0] as! String
    }
    
    class func  getCachesPath()->String{
        var path:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        return path[0] as! String
    }
    
    class func getImageForBundle(fileName: String!)->UIImage{
        return UIImage(named:fileName)!
    }
    
    class func getImageFormDecoument(fileName: String!)->UIImage{
        return UIImage(contentsOfFile: getDocumentPath()+"/"+fileName)!
    }
    
    class func saveBundleImageToDoc(imageName: String!,saveImageName: String!)->Bool{
        var uniquePath:String = getDocumentPath()+"/"+saveImageName
        
        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(uniquePath)
        if blHave {
            var blDele:Bool = NSFileManager.defaultManager().removeItemAtPath(uniquePath, error: nil)
            if blDele {
                println("delet success")
            }else{
                println("delet erro")
                return false
            }
        }
        var arry =  imageName.componentsSeparatedByString(".")
        var path:String =  NSBundle.mainBundle().pathForResource(arry[0] as String, ofType: arry[1] as String)!
        var data:NSData = NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMapped, error: nil)! //.dataWithContentsOfFile(path,options: NSDataReadingOptions.DataReadingMapped,error:nil )!
        var result:Bool = data.writeToFile(uniquePath, atomically: true)
        return result
    }
    
    class func deletFileFromDoc(fileName: String!)->Bool{
        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(getDocumentPath()+"/"+fileName)
        if blHave {
            return NSFileManager.defaultManager().removeItemAtPath(getDocumentPath()+"/"+fileName, error: nil)
        }else{
            return false
        }
    }
    
    class func saveDataPlistToDoc(plistName:String!,listData:NSMutableDictionary!)->Bool{
        var result:Bool =  listData.writeToFile(getDocumentPath()+"/"+plistName, atomically: true)
        return result;
    }
}
