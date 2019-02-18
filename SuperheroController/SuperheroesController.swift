//
//  SuperheroesController.swift
//  Comics
//
//  Created by Mac on 15/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SuperheroesController: UIViewController {
   
    
    
    @IBOutlet weak var img_ironman: UIImageView!
   
    @IBOutlet weak var btn_iron_man: UIButton!
    
    @IBAction func btn_iron_man_action(_ sender: Any)
    {
        let json_ironman = self.storyboard?.instantiateViewController(withIdentifier: "json_ironman") as! json_ironman
        self.navigationController?.pushViewController(json_ironman, animated: true)
    }
    
    @IBOutlet weak var img_batman: UIImageView!
    
    @IBOutlet weak var btn_batman: UIButton!
    
    @IBAction func btn_batman_action(_ sender: Any)
    {
        let json_batman = self.storyboard?.instantiateViewController(withIdentifier: "json_batman") as! json_batman
        self.navigationController?.pushViewController(json_batman, animated: true)
    }
    
    @IBOutlet weak var img_superman: UIImageView!
    
    @IBOutlet weak var btn_superman: UIButton!
    
    @IBAction func btn_superman_action(_ sender: Any)
    {
        let json_superman = self.storyboard?.instantiateViewController(withIdentifier: "json_superman") as! json_superman
        self.navigationController?.pushViewController(json_superman, animated: true)
    }
    
    @IBOutlet weak var img_cap_america: UIImageView!
    
    @IBOutlet weak var btn_cap_america: UIButton!
    
    @IBAction func btn_cap_america_action(_ sender: Any)
    {
        let json_cap_america = self.storyboard?.instantiateViewController(withIdentifier: "json_cap_america") as! json_cap_america
        self.navigationController?.pushViewController(json_cap_america, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
 
  
}
