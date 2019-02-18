//
//  web_view_dc.swift
//  Comics
//
//  Created by Mac on 15/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class web_view_dc: UIViewController {
    @IBOutlet weak var web_wbView_dc: UIWebView!
    @IBOutlet weak var btn_back_to_dc: UIButton!
    @IBAction func btn_back_to_dc_action(_ sender: Any)
    {
        let dc_controller = self.storyboard?.instantiateViewController(withIdentifier: "dc_controller") as? dc_controller
        self.navigationController?.pushViewController(dc_controller!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "https://youtu.be/qEAIVGKm-W8")
        let requestObj = NSURLRequest(url: url! as URL)
        web_wbView_dc.loadRequest(requestObj as URLRequest)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
