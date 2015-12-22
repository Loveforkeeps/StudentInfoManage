//
//  ViewController.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/2/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var flag:Int = 0
    
    @IBOutlet weak var teacherID: UITextField!

    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func replace(sender: AnyObject) {
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        //声明数据的请求
        let fetchRequest:NSFetchRequest = NSFetchRequest(entityName: "User")
        fetchRequest.fetchLimit = 100
        fetchRequest.fetchOffset = 0
        do {
        //声明一个实体结构
        let entity:NSEntityDescription? = NSEntityDescription.entityForName("User", inManagedObjectContext: context)
        //设置请求的实体结构
        fetchRequest.entity = entity
        //设置查询条件
//        fetchRequest.predicate = NSPredicate(format: "tarcherID = \(teacherID.text)" , "")
        
        let results = try context.executeFetchRequest(fetchRequest)

            if results.count > 0 {
                for items in results as! [NSManagedObject] {
                    let usnm = items.valueForKey("teacherID") as! String
                    let pawd = items.valueForKey("password") as! String
                    print("用户名和密码为\(usnm):\(pawd)")
                    
                    if (password.text == pawd && teacherID.text == usnm) {
                        flag = 1
                        break
                    }
                }
            }//end if statement
        
        } catch {
            
        print("验证密码错误")
        }
        
        
        
        if (flag == 1) {
            //界面跳转到下一个界面
            let myStoryBoard = self.storyboard
            
            let useTabBar = myStoryBoard?.instantiateViewControllerWithIdentifier("post")
            
            self.presentViewController(useTabBar!, animated: true, completion: { () -> Void in
                print("进入管理员界面")
                self.flag = 0
                
            })
        } else {
            let alertController = UIAlertController(title: "警告", message: "用户名或密码输入错误！", preferredStyle: UIAlertControllerStyle.Alert)
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        teacherID.leftView = UIImageView(image: UIImage(named: "user_49.222520107239px_1187757_easyicon.net"))
        teacherID.leftViewMode = UITextFieldViewMode.Always

        password.leftView = UIImageView(image: UIImage(named: "password_32px_1169936_easyicon.net"))
        
        password.leftViewMode = UITextFieldViewMode.Always
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //返回当前界面
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

