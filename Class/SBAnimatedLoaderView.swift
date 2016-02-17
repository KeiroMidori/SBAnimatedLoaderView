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
        
        let imageView = UIImageView(frame: CGRectMake((self.frame.width - 55) / 2, 30, 50, 50))
        imageView.contentMode = UIViewContentMode.Center
        var spriteArray = [UIImage]()
        for(var i = 0; i < numberOfSprites; i++) {
            if let image = UIImage(named: "\(spriteName)\(i)") {
                image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
                spriteArray.append(image)
            }
        }
        
        imageView.animationImages = spriteArray
        imageView.animationDuration = animationDuration
        self.addSubview(imageView)
        imageView.startAnimating()
        
        let loadingLabel = UILabel(frame: CGRectMake((self.frame.width - 115) / 2, self.frame.height - 40, 115, 20))
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

