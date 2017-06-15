//
//  ViewController.swift
//  L01AppDemo
//
//  Created by mengai on 2016/12/7.
//  Copyright © 2016年 Meng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let oldVisibleIndex: Array = ["a"]
        let newVisibleIndex: Array = ["b"]
        let indexsToRemove: NSMutableArray = NSMutableArray(array: oldVisibleIndex)
        indexsToRemove.removeObjects(in: newVisibleIndex)
        let indexsToAdd: NSMutableArray = NSMutableArray(array: newVisibleIndex)
        indexsToAdd.removeObjects(in: oldVisibleIndex)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

