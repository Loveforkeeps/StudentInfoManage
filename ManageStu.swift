//
//  ManageStu.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/22/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData

class ManageStu: UIViewController {
    
    var delegate:ManageStuDelegate?
    
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
    
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var sexTF: UITextField!
    
    @IBOutlet var noTF: UITextField!
    
    @IBOutlet var collegeTF: UITextField!
    
    @IBOutlet var specialityTF: UITextField!
    
    @IBOutlet var classNoTF: UITextField!
    
    @IBOutlet var idTF: UITextField!
    
    @IBOutlet var hometownTF: UITextField!
    
    @IBOutlet var nativePlaceTF: UITextField!
    
    @IBOutlet var attendYearTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.text = name
        sexTF.text = sex
        noTF.text = no
        collegeTF.text = college
        specialityTF.text = speciality
        classNoTF.text = String(classNo)
        idTF.text = id
        hometownTF.text = hometown
        nativePlaceTF.text = nativePlace
        attendYearTF.text = attentionYear
        

    }
    @IBAction func changeStu(sender: AnyObject) {
        //设置管理用户的上下文
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Student")
        //设置查询语句
        let str:String = "sno = '\(noTF.text!)'"
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        
        do {
            let results = try context.executeFetchRequest(fetch)
            for item in results as! [Student] {
                
                item.sno = noTF.text!
                item.name = nameTF.text!
                item.sex = sexTF.text!
                item.college = collegeTF.text!
                item.speciality = specialityTF.text!
                item.classNo = Int(classNoTF.text!)
                item.id = idTF.text!
                item.hometown = hometownTF.text!
                item.nativePlace = nativePlaceTF.text!
                item.attentionYear = attendYearTF.text!
                
            }
            
        }catch{
            print("保存错误！！！")
        }
        
        do {
            try context.save()
            print("更新数据成功！")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }

    @IBAction func deleteStu(sender: AnyObject) {
        //设置管理用户的上下文
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context = app.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "Student")
        //设置查询语句
        let str:String = "sno = '\(noTF.text!)'"
        print(str)
        
        fetch.predicate = NSPredicate(format: str, "")
        
        do {
            let results = try context.executeFetchRequest(fetch)
            
            for item in results as! [Student] {
                context.deleteObject(item)
            }
        }catch{
            print("删除失败！")
        }
        
        
        do {
            try context.save()
            print("更新数据成功！")
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
