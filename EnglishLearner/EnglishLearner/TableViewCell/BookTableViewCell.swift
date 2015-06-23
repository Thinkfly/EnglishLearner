//
//  BookTableViewCell.swift
//  EnglishLearner
//
//  Created by app on 15/6/15.
//  Copyright (c) 2015年 thinkfly. All rights reserved.
//

import UIKit
import SnapKit

class BookTableViewCell: UITableViewCell {
    
    var label : UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initSubViews()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //初始化子视图
    func initSubViews() {
        label = UILabel()
        //label.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(label)
        
        label.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.leading.equalTo(self.contentView).offset(30)
            make.trailing.equalTo(self.contentView).offset(-30)
            make.top.equalTo(self.contentView).offset(0)
            make.bottom.equalTo(self.contentView).offset(0)
        }
    }

}
