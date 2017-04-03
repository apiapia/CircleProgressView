//
//  ViewController.swift
//  CircleProgressView
//
//  Created by BearLin on 2017/2/4.
//  Copyright © 2017年 BearLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 可以通过Storyboard或者CircleProgressView(frame: CGRect)创建环形进度条
    @IBOutlet weak var progressView: CircleProgressView!
    @IBOutlet weak var progressLabel: UILabel!

    var currentProgress: Int = 0 {
        didSet {
            progressLabel.text = "\(currentProgress)%"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentProgress = progressView.progress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBActions
    
    @IBAction func plusAction(_ sender: UIButton) {
        let num = arc4random_uniform(10)
        
        currentProgress += Int(num)
        currentProgress = currentProgress > 100 ? 100 : currentProgress
        
        progressView.setProgress(currentProgress, animated: true, withDuration: 0.50)
    }
    
    @IBAction func minusAction(_ sender: UIButton) {
        let num = arc4random_uniform(10)
        
        currentProgress -= Int(num)
        currentProgress = currentProgress < 0 ? 0 : currentProgress

        progressView.setProgress(currentProgress, animated: true, withDuration: 0.50)
    }
    
}

