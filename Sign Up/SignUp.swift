//
//  SignUp.swift
//  Comics
//
//  Created by Mac on 09/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SQLite3
class SignUp: UIViewController, UITextFieldDelegate{
    
    var db: OpaquePointer?
    var stmt: OpaquePointer?
    var arr_user_details = NSMutableArray()
    
    @IBOutlet weak var txt_name: UITextField!
    @IBOutlet weak var txt_email_id_s: UITextField!
    @IBOutlet weak var txt_password_s: UITextField!
    @IBOutlet weak var txt_confirm_password: UITextField!
    @IBOutlet weak var txt_mobile_number: UITextField!
    @IBOutlet weak var img_user_name: UIImageView!
    @IBOutlet weak var img_email: UIImageView!
    @IBOutlet weak var img_pass: UIImageView!
    @IBOutlet weak var img_conf_pass: UIImageView!
    @IBOutlet weak var img_phone_no: UIImageView!
    
    
    // MARK: - password and confirm password
    @IBOutlet weak var btn_submit: UIButton!

    
    
    @IBAction func btn_submit_action(_ sender: Any)
    {
        if txt_name.text! == "" || txt_password_s.text! == "" || txt_confirm_password.text == "" || txt_email_id_s.text! == "" || txt_mobile_number.text! == ""
        {
//            show_alert_1()
            let alert_view_1 = UIAlertController(title: "Error", message: "All fields are mandatory!", preferredStyle:.alert)
            
            let btn_action_1 = UIAlertAction(title: "OK", style: .default) {
                (alertview) in
                print("OK pressed")
            }
            alert_view_1.addAction(btn_action_1)
            self.present(alert_view_1, animated: true, completion: nil)
        }
        if txt_password_s.text != txt_confirm_password.text
        {
//            show_alert()
            let alert_view = UIAlertController(title: "Error", message: "Password do not match!", preferredStyle:.alert)
            
            let btn_action = UIAlertAction(title: "OK", style: .default) {
                (alertview) in
                print("OK pressed")
            }
            alert_view.addAction(btn_action)
            self.present(alert_view, animated: true, completion: nil)
        }
        else
        {
            insert_data()
            display()
            self.navigationController?.popViewController(animated: true)
           
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        arr_user_details = NSMutableArray()
        create_db()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Mobile number and email validation
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == txt_mobile_number
        {
        let char = string.cString(using: String.Encoding.utf8)
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92){
            print("Backspace was pressed")
        }
        else if (txt_mobile_number.text?.count)! < 10
        {
            let formate_pre = "^[0-9]$"
            let result_predicate : NSPredicate = NSPredicate(format: "SELF MATCHES %@",formate_pre)
            return result_predicate.evaluate(with: string)
        }
        else
        {
            return false
        }
        
      if (textField == txt_email_id_s)
      {
       if (txt_email_id_s.text?.count)! > 30
        {
            let email_id = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]$"
            let email_id_Predicate : NSPredicate = NSPredicate(format: "SELF MATCHES %@",email_id)
            return email_id_Predicate.evaluate(with: string)
        }
        else
        {
            return false
        }
     }
    }
   return true
  }
    
    
    // MARK: - SQLite3
    func create_db()
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("UserDetailDB.sqlite")


        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
        }
        else
        {
            print("database created successfully ")
            create_table()
        }
    }

    func create_table()
    {
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS User_detail_table1 (user_name TEXT, email_id TEXT, password TEXT, confirm_password TEXT, mobile_no TEXT)", nil, nil, nil) != SQLITE_OK
        {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        else
        {
            print("table created successfully ")
        }
    }

    func insert_data()
    {
        //the insert query
        
        let queryString = "INSERT INTO User_detail_table1 (user_name,email_id,password,confirm_password,mobile_no) VALUES ('\(txt_name.text!)','\(txt_email_id_s.text!)','\(txt_password_s.text!)','\(txt_confirm_password.text!)','\(txt_mobile_number.text!)')"


        print ("insert statement....\(queryString)")
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) == SQLITE_OK
        {
            if sqlite3_step(stmt) == SQLITE_DONE
            {
                print("Successfully inserted row.")
                display()
            } else {
                print("Could not Update row.")
            }
        }
    }

    func display()
    {
        let queryString = "SELECT * FROM User_detail_table1"
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK
        {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        arr_user_details = NSMutableArray()
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let user_name = String(cString: sqlite3_column_text(stmt, 0))
            let email_id = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            let confirm_password = String(cString: sqlite3_column_text(stmt, 3))
            let mobile_no = String(cString: sqlite3_column_text(stmt, 4))
    
            let animMutableDictionary = NSMutableDictionary()
            animMutableDictionary.setValue(user_name, forKey: "user_name")
            animMutableDictionary.setValue(email_id, forKey: "email_id")
            animMutableDictionary.setValue(password, forKey: "password")
            animMutableDictionary.setValue(confirm_password, forKey: "confirm_password")
            animMutableDictionary.setValue(mobile_no, forKey: "mobile_no")
            print("Dict user...\(animMutableDictionary)")
            arr_user_details.add(animMutableDictionary)
        }
    }
}
