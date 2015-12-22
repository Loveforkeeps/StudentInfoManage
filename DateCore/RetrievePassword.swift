//
//  RetrievePassword.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/6/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData

class RetrievePassword: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet var answer: UITextField!
    @IBOutlet var teacherID: UITextField!
    @IBOutlet var questText: UITextView!
    var flag = 1
    var names = [String]()
    
    @IBAction func showQuestion () {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Verify")
        
        let str:String = "teacherID = '\(teacherID.text!)'"
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        do {
            let results = try context.executeFetchRequest(fetch)
            
            print(results)
            
            for items in results as! [NSManagedObject] {
                
                let quest = items.valueForKey("question") as! String
                print("答案和密码为 \(quest)")
                
                questText.text = quest
                
            }
        }catch{
            print("读取用户验证问题出错！")
        }

    }
    
    @IBAction func retrieve() {
        //设置管理用户的上下文
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Verify")
        
        let str:String = "teacherID = '\(teacherID.text!)'"
        
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        
        
        do {
            
            let results = try context.executeFetchRequest(fetch)
            print(results)
            
            
    //遍历所有查询出来的对象
            for items in results as! [NSManagedObject] {
                let answ = items.valueForKey("answer") as! String
                let quest = items.valueForKey("question") as! String
                print("答案和问题为  \(answ)：\(quest)")
    //密码验证
                if (answer.text == answ) {
                    let alert = UIAlertController(title: "验证成功！",
                        message: "请输入一个新的密码",
                        preferredStyle: .Alert)
                    
                    let saveAction = UIAlertAction(title: "保存",
                        style: .Default,
                        handler: { (action:UIAlertAction) -> Void in
                            
                            let textField = alert.textFields!.first
                            self.names.append(textField!.text!)
                            self.changePwd(textField!.text!)
                    })
                    
                    let cancelAction = UIAlertAction(title: "取消",
                        style: .Default) { (action: UIAlertAction) -> Void in
                    }
                    
                    alert.addTextFieldWithConfigurationHandler {
                        (textField: UITextField) -> Void in
                    }
                    
                    alert.addAction(saveAction)
                    alert.addAction(cancelAction)
                    
                    presentViewController(alert,
                        animated: true,
                        completion: nil)
                
//                    let alert = UIAlertController(title: "验证成功！", message: "输入您的新密码", preferredStyle:.Alert)
//                
//                    alert.addTextFieldWithConfigurationHandler { (textField) in
//                        textField.placeholder = "Password"
//                        textField.secureTextEntry = true
//                    }
//                    let goTo = UIAlertAction(title: "确定", style:.Default, handler: nil)
//                    alert.addAction(goTo)
//                    
//    //完成密码后修改新密码
//                    self.presentViewController(alert, animated: true, completion: { () -> Void in
//                        let requestUser = NSFetchRequest(entityName: "User")
//                        requestUser.predicate = NSPredicate(format: str, "")
//                        do {
//                            let results = try context.executeFetchRequest(requestUser)
//                            for item in results as! [User]{
////                                item.password! = textField
//                                print(item.password!)
//                                
//                            }
//                        }catch{
//                            
//                        }
                        
//                    })
                    
                }else{
                    let alert = UIAlertController(title: "验证失败！", message: "验证答案输入错误，请确认后输入", preferredStyle: .Alert)
                    let sure = UIAlertAction(title: "确定", style: .Destructive, handler: nil)
                    alert.addAction(sure)
                    self.presentViewController(alert, animated: true, completion: nil)

                }
                
            }
        }catch{
            print("查询用户验证出错！")
        }
    }
    

    func changePwd(name: String) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Verify")
        
        let str:String = "teacherID = '\(teacherID.text!)'"
        
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        
        

        let requestUser = NSFetchRequest(entityName: "User")
        requestUser.predicate = NSPredicate(format: str, "")

        do {
            let results = try context.executeFetchRequest(requestUser)
            for item in results as! [User]{
                print(item.password!)
                
                item.password! = name
            
                print("修改后的数据为\(item.password!)")
                
                }
        } catch let error as NSError
            {
            print("Could not change \(error), \(error.userInfo)")
            }
        
        do {
            try context.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
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
