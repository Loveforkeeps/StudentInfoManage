//
//  ViewController.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/2/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var teacherID: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func replace(sender: AnyObject) {
        if (teacherID.text == "EMo" && password.text == "123") {
        
            //界面跳转到下一个界面
                let myStoryBoard = self.storyboard
                
                let useTabBar = myStoryBoard?.instantiateViewControllerWithIdentifier("post")
                
                self.presentViewController(useTabBar!, animated: true, completion: { () -> Void in
                    print("进入管理员界面")
                
                
                })
           
            
           
        }
        else {
             let alertController = UIAlertController(title: "警告", message: "用户名或密码输入错误！", preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func close(segue: UIStoryboardSegue) {
        print("close")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        teacherID.resignFirstResponder()
        password.resignFirstResponder()
    }
    @IBAction func nextTextfield() {
        self.password .becomeFirstResponder()
    }
    
}

