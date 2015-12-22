//
//  SignUp.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/5/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData

//@objc(SignUp)

class SignUp: UIViewController,UITextFieldDelegate  {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    var nullflag:Int8 = 0
    
    //用户基本信息
    @IBOutlet var name: UITextField!
    
    @IBOutlet var profession: UITextField!
    
    @IBOutlet var department: UITextField!
    
    @IBOutlet var teacherID: UITextField!
    
    @IBOutlet var password: UITextField!
    //密码找回
    
    @IBOutlet var question: UITextField!
    
    @IBOutlet var answer: UITextField!
    
    
    
    
    @IBAction func endEDiting(sender: UITextField!) {
        if (sender.text == ""){
            sender.placeholder = "不能为空"
        }else{
            nullflag++
        }
    }
   
    
    //点击背景关闭键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        name.resignFirstResponder()
        profession.resignFirstResponder()
        department.resignFirstResponder()
        teacherID.resignFirstResponder()
        password.resignFirstResponder()
        
        question.resignFirstResponder()
        answer.resignFirstResponder()
    }
    
    
    @IBAction func signup(sender: AnyObject) {
        
        if(nullflag >= 4) {
            
        
        
        //添加数据库用户
        
        //获取管理的数据上下文对象
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
        //var error:NSError?
        
        
        //创建User对象
        let oneUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as! User
        
        
        //创建密码验证对象
        let verify = NSEntityDescription.insertNewObjectForEntityForName("Verify", inManagedObjectContext: context) as! Verify
        
        
        //对象赋值
        oneUser.name = name.text
        oneUser.professional = profession.text
        oneUser.college = department.text
        oneUser.teacherID = teacherID.text
        oneUser.password = password.text
        
        verify.teacherID = teacherID.text
        verify.question = question.text
        verify.answer = answer.text
        
        //保存
        do {
            try context.save()
            print(oneUser)
            print(verify)
            let alert = UIAlertController(title: "创建成功！", message: "返回登陆界面登陆", preferredStyle:.Alert)
            let goTo = UIAlertAction(title: "确定", style:.Default, handler: nil)
            alert.addAction(goTo)
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            let alert = UIAlertController(title: "保存失败！", message: "请重新申请！", preferredStyle:.Alert)
            let cancel = UIAlertAction(title: "取消", style:.Cancel, handler: nil)
            let again  = UIAlertAction(title: "再试一遍", style: .Default, handler: nil)
            alert.addAction(cancel)
            alert.addAction(again)
            self.presentViewController(alert, animated: true, completion: nil)
        }//context save
        }else{
            let alert = UIAlertController(title: "无法创建！", message: "请根据要求填写完整信息！", preferredStyle: .Alert)
            
            let cancel = UIAlertAction(title: "取消", style: .Default, handler: nil)
            
            alert.addAction(cancel)
            self.presentViewController(alert, animated: true, completion: nil)
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
