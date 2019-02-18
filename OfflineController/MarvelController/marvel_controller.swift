//
//  marvel_controller.swift
//  Comics
//
//  Created by Mac on 13/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class marvel_controller: UIViewController {
    
    
    @IBOutlet weak var mrvl_navigation: UINavigationItem!
    @IBOutlet weak var img_marvel_comic: UIImageView!
    
    @IBOutlet weak var lbl_marvel_title: UILabel!
    @IBOutlet weak var coll_mrvl_collect_view: UICollectionView!
    @IBOutlet weak var btn_marvel_trailor: UIButton!
    @IBAction func btn_marvel_trailor_action(_ sender: Any)
    {
        let web_view_marvel = self.storyboard?.instantiateViewController(withIdentifier: "web_view_marvel") as! web_view_marvel
        self.navigationController?.pushViewController(web_view_marvel, animated: true)
    }
    @IBOutlet weak var btn_read_comics: UIButton!
    
    @IBAction func btn_read_comics_action(_ sender: Any)
    {
        let mrvel_comics_controller = self.storyboard?.instantiateViewController(withIdentifier: "mrvel_comics_controller") as! mrvel_comics_controller
        self.navigationController?.pushViewController(mrvel_comics_controller, animated: true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.navigationItem.hidesBackButton = true
//    }
}
