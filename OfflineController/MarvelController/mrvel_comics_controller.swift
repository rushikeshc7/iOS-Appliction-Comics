//
//  mrvel_comics_controller.swift
//  Comics
//
//  Created by Mac on 29/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class mrvel_comics_controller: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var arr_items = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dict_sample : [String:String] = ["img_name" : "Iron_Man", "lbl_name" : "IRON MAN", "img_1" : "IM_1", "img_2" : "IM_2", "img_3" : "IM_3", "img_4" : "IM_4", "img_5" : "IM_5", "img_6" : "IM_6", "img_7" : "IM_7"]
        let dict_sample_1 : [String:String] = ["img_name" : "Captain_America", "lbl_name" : "CAPTAIN AMERICA", "img_1" : "CA_1", "img_2" : "CA_2", "img_3" : "CA_3", "img_4" : "CA_4", "img_5" : "CA_5", "img_6" : "CA_6", "img_7" : "CA_7"]
        arr_items = NSMutableArray()
        arr_items.add(dict_sample)
        arr_items.add(dict_sample_1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "marvel_collect_view", for: indexPath as IndexPath) as! marvel_collect_view
        var dict_items = arr_items[indexPath.item] as! [String:Any]
        let image : UIImage = UIImage(named: dict_items["img_name"] as! String)!
        print("Image is loading \(image)")
        cell.img_mrvl_comic.image = image
        cell.lbl_mrvl_comic_name.text = dict_items["lbl_name"] as? String
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dict_items = arr_items[indexPath.item] as! [String:Any]
        let view: mrvl_page_view = self.storyboard?.instantiateViewController(withIdentifier: "mrvl_page_view") as! mrvl_page_view
        view.dict_items_mrvlPageVC = dict_items
        self.navigationController?.pushViewController(view, animated: true)
    }
    
}
