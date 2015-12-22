//
//  SelectStu.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/12/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData

class SelectStu: UIViewController,ManageStuDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        print("加载")
    }
    
    var no:String = ""
    var name:String = ""
    var attentionYear:String = ""
    var classNo:NSNumber = 0.0
    var college:String = ""
    var hometown:String = ""
    var id:String = ""
    var nativePlace:String = ""
    var sex:String = ""
    var speciality:String = ""
    
    //用判定是否要跳转到个人管理界面
    var flag:Bool = false
    
    @IBOutlet var sNo: UITextField!
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if flag{
            
            return true
        }else{
            return false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditView"{
            //通过seque的标识获得跳转目标
            let controller = segue.destinationViewController as! ManageStu
            //设置代理
            controller.delegate = self
            //将值传递给新页面
            controller.no = no
            controller.name = name
            controller.sex = sex
            controller.attentionYear = attentionYear
            controller.classNo = classNo
            controller.college = college
            controller.hometown = hometown
            controller.id = id
            controller.nativePlace = nativePlace
            controller.speciality = speciality
            
            
        }
    }
    
    @IBAction func selectStu(sender: AnyObject) {
        
        //设置管理用户的上下文
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Student")
        
//        fetch.returnsObjectsAsFaults = false//将其所有的属性加载到内存中
        
        let str:String = "sno = '\(sNo.text!)'"
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        

        do {
            let results = try context.executeFetchRequest(fetch)
            
            print(results)
            if (results.count == 0) {
                print("查询失败！没有该条记录")
                //无数据提醒
                let alert = UIAlertController(title: "查询失败！", message: "请核对学号是否输入正确！", preferredStyle: UIAlertControllerStyle.Alert)
                let confirmAlert = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(confirmAlert)
                self.presentViewController(alert, animated: true, completion: nil)
            }else{
                
            
                for item in results as! [NSManagedObject] {
                    
                    no            = item.valueForKey("sno") as! String
                    name          = item.valueForKey("name") as! String
                    attentionYear = item.valueForKey("attentionYear") as! String
                    classNo       = item.valueForKey("classNo") as! NSNumber
                    college       = item.valueForKey("college") as! String
                    hometown      = item.valueForKey("hometown") as! String
                    id            = item.valueForKey("id") as! String
                    nativePlace   = item.valueForKey("nativePlace") as! String
                    sex           = item.valueForKey("sex") as! String
                    speciality    = item.valueForKey("speciality") as! String
                    
                    print("\(no) \(name) \(attentionYear) \(classNo) \(college)\(hometown) \(id) \(nativePlace) \(sex) \(speciality)")
                    //页面跳转
//                    let myStoryboard = self.storyboard
//                    let changeView = myStoryboard?.instantiateViewControllerWithIdentifier("manage")
//
//                    self.presentViewController(changeView!, animated: true, completion: { () -> Void in
//                        print("进入学生管理界面!")
                    
//                    })
                    //调用segue进行跳转
                    flag = true
                    self.performSegueWithIdentifier("EditView", sender: self)
                }

            }
        }catch{
            print("查询出错！")
        }
        
    }
    
    func editInfo(controller:ManageStu){
        
        //关闭编辑页面
        controller.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func editInfoDidCancer(controller:ManageStu){
        //关闭编辑页面
        controller.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
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
