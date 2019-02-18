//
//  ComicsController.swift
//  Comics
//
//  Created by Mac on 15/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ComicsController: UIViewController {
    @IBOutlet weak var btn_marvel: UIButton!
    @IBAction func btn_marvel_action(_ sender: Any)
    {
        let marvel_controller = self.storyboard?.instantiateViewController(withIdentifier: "marvel_controller") as! marvel_controller
        self.navigationController?.pushViewController(marvel_controller, animated: true)
    }
    
    @IBOutlet weak var btn_dc: UIButton!
    @IBAction func btn_dc_action(_ sender: Any)
    {
        let dc_controller = self.storyboard?.instantiateViewController(withIdentifier: "dc_controller") as! dc_controller
        self.navigationController?.pushViewController(dc_controller, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
