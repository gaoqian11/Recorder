//
//  ViewController.swift
//  Record
//
//  Created by yebaojia on 16/3/19.
//  Copyright © 2016年 mjia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 使用 先录音 然后在停止录音，然后才播放
    override func viewDidLoad() {
        super.viewDidLoad()
        let recordBtn  = UIButton.init(frame: CGRectMake(20, 40, 100, 100))
        recordBtn.backgroundColor = UIColor.blackColor()
        recordBtn.setTitle("record", forState: UIControlState.Normal)
        recordBtn.addTarget(self, action: "startRecord", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(recordBtn)
        let stopRecordBtn = UIButton.init(frame: CGRectMake(20, 150, 100, 100))
        stopRecordBtn.setTitle("stopRecord", forState: UIControlState.Normal)
        stopRecordBtn.addTarget(self, action: "stopRecord", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(stopRecordBtn)
        stopRecordBtn.backgroundColor = UIColor.blackColor()
        let playBtn = UIButton.init(frame: CGRectMake(20, 260, 100, 100))
        playBtn.setTitle("play", forState: UIControlState.Normal)
        playBtn.addTarget(self, action: "playRecord", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(playBtn)
        playBtn.backgroundColor = UIColor.blackColor()
        let stopPlayBtn = UIButton.init(frame: CGRectMake(20, 370, 100, 100))
        stopPlayBtn.setTitle("stopPlay", forState: UIControlState.Normal)
        stopRecordBtn.addTarget(self, action: "stopPlay", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(stopPlayBtn)
        stopPlayBtn.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startRecord(){
        RecorderTool.getTool().startRecord()
    }
    
    func stopRecord(){
        RecorderTool.getTool().stopRecord()
        RecorderTool.getTool().saveRecord()
    }
    
    func playRecord(){
        let userdefault = NSUserDefaults.standardUserDefaults()
        var arr = [[String : String]]()
        if let a = userdefault.objectForKey("audio")
        {
            arr = a as! [[String : String]]
            //获取最后一首录音
            var dict = arr[arr.count - 1]
            RecorderTool.getTool().playRecord(dict["path"]!)
        }
    }
    func stopPlay(){
        let userdefault = NSUserDefaults.standardUserDefaults()
        var arr = [[String : String]]()
        if let a = userdefault.objectForKey("audio")
        {
            arr = a as! [[String : String]]
            //获取最后一首录音
            var dict = arr[arr.count - 1]
            RecorderTool.getTool().stopPlayRecord(dict["path"]!);
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

