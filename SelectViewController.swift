//
//  SelectViewController.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/7/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let alertSuccess = UIAlertController(title: "恭喜你", message: "登陆成功！现在可执行管理员操作！", preferredStyle: UIAlertControllerStyle.Alert)
        let confirmAlert = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
        alertSuccess.addAction(confirmAlert)
        self.presentViewController(alertSuccess, animated: true, completion: nil)
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
