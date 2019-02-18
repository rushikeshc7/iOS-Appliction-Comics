//
//  dc_controller.swift
//  Comics
//
//  Created by Mac on 15/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class dc_controller: UIViewController {
    
    
    @IBOutlet weak var dc_navigation_out: UINavigationItem!
    @IBOutlet weak var img_dc_comic: UIImageView!
    
    @IBOutlet weak var btn_dc_trailor: UIButton!
    @IBAction func btn_dc_trailor_action(_ sender: Any)
    {
        let web_view_dc = self.storyboard?.instantiateViewController(withIdentifier: "web_view_dc") as! web_view_dc
        self.navigationController?.pushViewController(web_view_dc, animated: true)
        
    }
    @IBOutlet weak var btn_read_comics_dc: UIButton!
    @IBAction func btn_read_comics_dc_action(_ sender: Any)
    {
        let dc_comics_controller = self.storyboard?.instantiateViewController(withIdentifier: "dc_comics_controller") as! dc_comics_controller
        self.navigationController?.pushViewController(dc_comics_controller, animated: true)
    }
    
    @IBOutlet weak var lbl_dc_title: UILabel!
    @IBOutlet weak var coll_dc_collect_view: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
