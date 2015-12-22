//
//  StudentInsert.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/12/15.
//  Copyright © 2015 Wang. All rights reserved.
//

import UIKit
import CoreData
class StudentInsert: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var sNo: UITextField!
    @IBOutlet weak var sName: UITextField!
    @IBOutlet weak var sSex: UITextField!
    @IBOutlet weak var sID: UITextField!
    @IBOutlet weak var sNatiPlc: UITextField!
    @IBOutlet weak var sYear: UITextField!
    @IBOutlet weak var sHomeTown: UITextField!
    @IBOutlet weak var sCollege: UITextField!
    @IBOutlet weak var sSpeciality: UITextField!
    @IBOutlet weak var sClass: UITextField!

    @IBAction func InertStu(sender: AnyObject) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
        let oneStu = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: context) as! Student
        
        //对象赋值
        oneStu.sno = sNo.text
        oneStu.name = sName.text
        oneStu.sex = sSex.text
        oneStu.id = sID.text
        oneStu.nativePlace = sNatiPlc.text
        oneStu.attentionYear = sYear.text
        oneStu.hometown = sHomeTown.text
        oneStu.college = sCollege.text
        oneStu.speciality = sSpeciality.text
        oneStu.classNo = Int(sClass.text!)
        
        
        //保存数据
        
        do {
            try context.save()
            print(oneStu)
          
            let alert = UIAlertController(title: "导入成功！", message: "可去查询页面进行修改", preferredStyle:.Alert)
            let goTo = UIAlertAction(title: "确定", style:.Default, handler: nil)
            alert.addAction(goTo)
            self.presentViewController(alert, animated: true, completion: nil)
            
            //保存数据后输入框清零
            
            sNo.text = ""
            sName.text = ""
            sSex.text = ""
            sID.text = ""
            sNatiPlc.text = ""
            sYear.text = ""
            sHomeTown.text = ""
            sCollege.text = ""
            sCollege.text = ""
            sSpeciality.text = ""
            sClass.text = ""
            
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            let alert = UIAlertController(title: "保存失败！", message: "请重新导入！", preferredStyle:.Alert)
            let cancel = UIAlertAction(title: "取消", style:.Cancel, handler: nil)
            let again  = UIAlertAction(title: "再试一遍", style: .Default, handler: nil)
            alert.addAction(cancel)
            alert.addAction(again)
            self.presentViewController(alert, animated: true, completion: nil)
        }//context

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
