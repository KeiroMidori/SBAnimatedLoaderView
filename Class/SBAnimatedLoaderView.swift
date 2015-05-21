//
//  SBAnimatedLoaderView.swift
//  SBLoaderView
//
//  Created by Sacha BECOURT on 5/11/15.
//  Copyright (c) 2015 SB. All rights reserved.
//

import UIKit

class SBAnimatedLoaderView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    init(frame: CGRect, color: UIColor, spriteName: String, numberOfSprites: Int, animationDuration: NSTimeInterval, labelString: String, labelTextColor: UIColor) {
        super.init(frame: frame)
        
        self.backgroundColor = color
        self.alpha = 0.0
        self.layer.cornerRadius = 10
        
        var soraImageView = UIImageView(frame: CGRectMake((self.frame.width - 55) / 2, 30, 50, 50))
        soraImageView.contentMode = UIViewContentMode.Center
        var spriteArray = NSMutableArray(capacity: 0)
        for(var i = 0; i < numberOfSprites; i++) {
            var image = UIImage(named: NSString(format: "%@%d", spriteName, i) as String)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            spriteArray.addObject(image!)
        }
        
        soraImageView.animationImages = spriteArray as [AnyObject]
        soraImageView.animationDuration = animationDuration
        self.addSubview(soraImageView)
        soraImageView.startAnimating()
        
        var loadingLabel = UILabel(frame: CGRectMake((self.frame.width - 115) / 2, self.frame.height - 40, 115, 20))
        loadingLabel.text = labelString
        loadingLabel.numberOfLines = 0
        loadingLabel.textAlignment = NSTextAlignment.Center
        loadingLabel.textColor = labelTextColor
        
        self.transform = CGAffineTransformScale(self.transform, 1.5, 1.5);
        self.addSubview(loadingLabel)
    }
    
    func show() {
        UIView.animateWithDuration(0.3, animations: {
            self.transform = CGAffineTransformIdentity;
            self.alpha = 1
        })
    }
    
    func hide() {
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0.0
            self.transform = CGAffineTransformScale(self.transform, 1.5, 1.5);
            }, completion: { (done: Bool) -> Void in
                self.removeFromSuperview()
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

