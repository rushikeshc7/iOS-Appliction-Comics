//
//  Login.swift
//  Comics
//
//  Created by Mac on 10/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

import SQLite3
class Login: UIViewController {
   
    var db: OpaquePointer?
    var stmt: OpaquePointer?
    var arr_user_details = NSMutableArray()
    var password_secure: Bool!
    @IBOutlet weak var txt_email_id_l: UITextField!
    @IBOutlet weak var txt_password_l: UITextField!

    @IBOutlet weak var btn_login: UIButton!
    
    @IBOutlet weak var btn_signup: UIButton!
    @IBOutlet weak var btn_show_pass: UIButton!
    @IBOutlet weak var img_user: UIImageView!
    
   
    
    @IBAction func btn_signup_action(_ sender: Any)
    {
        let SignUp = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUp
        self.navigationController?.pushViewController(SignUp, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr_user_details = NSMutableArray()
        open_db()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - ShowPassword
    @IBAction func btn_show_pass_action(_ sender: Any)
    {
        if password_secure == false{
            password_secure = true
            txt_password_l.isSecureTextEntry = false
        }
        else
        {
            password_secure = false
            txt_password_l.isSecureTextEntry = true
        }
    }
    
    // MARK: - SQLite
    func open_db()
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("UserDetailDB.sqlite")


        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
        }
        else
        {
            print("database opened successfully ")
        }
    }
    
  
    @IBAction func btn_login_action(_ sender: Any)
    {
        if txt_email_id_l.text == "" || txt_password_l.text == ""
        {
            let alert_view_1 = UIAlertController(title: "Error", message: "All fields are mandatory!", preferredStyle:.alert)
            
            let btn_action_1 = UIAlertAction(title: "OK", style: .default) {
                (alertview) in
                print("OK pressed")
            }
            alert_view_1.addAction(btn_action_1)
            self.present(alert_view_1, animated: true, completion: nil)
        }
        else
        {
    
            let query = "select * from User_detail_table1 where email_id = '\(txt_email_id_l.text!)' and password = '\(txt_password_l.text!)'"
            print(query)
            let arr_user_details = NSMutableArray()
            sqlite3_prepare(db, query, -1, &stmt, nil)

            while sqlite3_step(stmt) == SQLITE_ROW {
                let email_id = String(cString: sqlite3_column_text(stmt, 1))
                let password = String(cString: sqlite3_column_text(stmt, 2))
                
                let animMutableDictionary_1 = NSMutableDictionary()
                animMutableDictionary_1.setValue(email_id, forKey: "email_id")
                animMutableDictionary_1.setValue(password, forKey: "password")
                arr_user_details.add(animMutableDictionary_1)
                print("User details...\(animMutableDictionary_1)")
                }
            if arr_user_details.count == 0
            {
                let alert_view = UIAlertController(title: "Login Unsucessfull!!", message: "Please check your details and try again!!", preferredStyle:.alert)
                
                let btn_action = UIAlertAction(title: "OK", style: .default) {
                    (alertview) in
                    print("OK pressed")
                }
                alert_view.addAction(btn_action)
                self.present(alert_view, animated: true, completion: nil)
            }
            else
            {
                let alert_view_2 = UIAlertController(title: "Login Successful!!", message: "Press OK to proceed", preferredStyle:.alert)
                
                let btn_action_2 = UIAlertAction(title: "OK", style: .default) {
                    (alertview) in
                    print("OK pressed")
                    let tab_bar_controller = self.storyboard?.instantiateViewController(withIdentifier: "tab_bar_controller") as! tab_bar_controller
                    self.navigationController?.pushViewController(tab_bar_controller, animated: true)
                }
                alert_view_2.addAction(btn_action_2)
                self.present(alert_view_2, animated: true, completion: nil)
               
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
