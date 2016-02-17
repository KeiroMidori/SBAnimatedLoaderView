//
//  ViewController.swift
//  SBLoaderViewExample
//
//  Created by Sacha BECOURT on 5/11/15.
//  Copyright (c) 2015 SB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loader = SBAnimatedLoaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        let width: CGFloat = 150
        let frame = CGRectMake((self.view.frame.width - width) / 2, (self.view.frame.height - width) / 2, width, width)
        let LoaderbackgroundColor = UIColor(red: CGFloat(22.0/255.0), green: CGFloat(158.0/255.0), blue: CGFloat(224.0/255.0), alpha: CGFloat(1.0))
        loader = SBAnimatedLoaderView(frame: frame, color: LoaderbackgroundColor, spriteName: "sora_", numberOfSprites: 8, animationDuration: 0.8, labelString: "Loading...", labelTextColor: UIColor.whiteColor())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func displayLoadingView(sender: AnyObject) {
        self.view.addSubview(loader)
        loader.show()
    }
    
    @IBAction func dismissLoadingView(sender: AnyObject) {
        loader.hide()
    }

}

