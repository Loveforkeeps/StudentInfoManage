//
//  SignUp.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/5/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signup(sender: AnyObject) {
        //添加数据库用户
        
        //成功之后返回到登陆界面
        let myView = self.storyboard
        let viewcont = myView?.instantiateViewControllerWithIdentifier("signin")
        self.presentViewController(viewcont!, animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
