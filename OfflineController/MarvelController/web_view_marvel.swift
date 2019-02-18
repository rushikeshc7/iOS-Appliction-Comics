//
//  web_view_marvel.swift
//  Comics
//
//  Created by Mac on 15/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class web_view_marvel: UIViewController {

    @IBOutlet weak var web_wbview_marvel: UIWebView!
    
    @IBOutlet weak var btn_back_to_mrvl: UIButton!
    @IBAction func btn_back_to_mrvl_action(_ sender: Any)
    {
            let marvel_controller = self.storyboard?.instantiateViewController(withIdentifier: "marvel_controller") as? marvel_controller
            self.navigationController?.pushViewController(marvel_controller!, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://youtu.be/mN_e5-fcGU4")
        let requestObj = NSURLRequest(url: url! as URL)
        web_wbview_marvel.loadRequest(requestObj as URLRequest)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
