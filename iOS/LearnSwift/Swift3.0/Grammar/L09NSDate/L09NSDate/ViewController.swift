//
//  ViewController.swift
//  L09NSDate
//
//  Created by mengai on 16/8/10.
//  Copyright © 2016年 Meng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentDateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        pring(text: "哈哈");
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pring(text : String) -> Void {
        NSLog("%@", text);
    }
    

}

