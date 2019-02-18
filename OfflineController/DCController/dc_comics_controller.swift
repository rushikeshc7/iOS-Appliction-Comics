//
//  dc_comics_controller.swift
//  Comics
//
//  Created by Mac on 29/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class dc_comics_controller: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var arr_items_1 = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        let dict_sample : [String:String] = ["img_name" : "Bat_man", "lbl_name" : "BATMAN", "img_1" : "B_1", "img_2" : "B_2", "img_3" : "B_3", "img_4" : "B_4", "img_5" : "B_5", "img_6" : "B_6", "img_7" : "B_7"]
        let dict_sample_1 : [String:String] = ["img_name" : "Super_man", "lbl_name" : "SUPERMAN", "img_1" : "S_1", "img_2" : "S_2", "img_3" : "S_3", "img_4" : "S_4", "img_5" : "S_5", "img_6" : "S_6", "img_7" : "S_7"]
        arr_items_1 = NSMutableArray()
        arr_items_1.add(dict_sample)
        arr_items_1.add(dict_sample_1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_items_1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell_1 = collectionView.dequeueReusableCell(withReuseIdentifier: "dc_collection_view", for: indexPath as IndexPath) as! dc_collection_view
        var dict_items_1 = arr_items_1[indexPath.item] as! [String:Any]
        let image_1 : UIImage = UIImage(named: dict_items_1["img_name"] as! String)!
        print("Image id loading..\(image_1)")
        cell_1.img_dc_comic_collect.image = image_1
        cell_1.lbl_dc_comic_name.text = dict_items_1["lbl_name"] as? String
        return cell_1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dict_items_1 = arr_items_1[indexPath.item] as! [String:Any]
        let view_1 : dc_page_view = storyboard?.instantiateViewController(withIdentifier: "dc_page_view") as! dc_page_view
        view_1.dict_items_dcPageVC = dict_items_1
        self.navigationController?.pushViewController(view_1, animated: true)
    
    }
}
