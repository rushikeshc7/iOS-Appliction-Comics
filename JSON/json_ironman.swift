//
//  json_ironman.swift
//  Comics
//
//  Created by Mac on 30/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

struct IronMan: Codable{
    let name: String?
    let full_name: String?
    let first_appearance: String?
    let publisher: String?
    let place_of_birth: String?
    let alter_egos: String?
    let alignment: String?
    
    private enum EncodingKeys: String, CodingKey {
        case name
        case full_name = "full-name"
        case first_appearance = "first-appearance"
        case publisher
        case place_of_birth = "place-of-birth"
        case alter_egos = "alter-egos"
        case alignment
    }
}
extension IronMan{
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: EncodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        first_appearance = try values.decodeIfPresent(String.self, forKey: .first_appearance)
        publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
        place_of_birth = try values.decodeIfPresent(String.self, forKey: .place_of_birth)
        alter_egos = try values.decodeIfPresent(String.self, forKey: .alter_egos)
        alignment = try values.decodeIfPresent(String.self, forKey: .alignment)
    }
}
class json_ironman: UIViewController {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_first_appear: UILabel!
    @IBOutlet weak var lbl_publisher: UILabel!
    @IBOutlet weak var lbl_birth_place: UILabel!
    @IBOutlet weak var lbl_alter: UILabel!
    @IBOutlet weak var lbl_alignment: UILabel!
    @IBOutlet weak var lbl_info: UILabel!
    
    
    @IBOutlet weak var lbl_n_name: UILabel!
    @IBOutlet weak var lbl_n_first_appear: UILabel!
    @IBOutlet weak var lbl_n_publisher: UILabel!
    @IBOutlet weak var lbl_n_birth_place: UILabel!
    @IBOutlet weak var lbl_n_alter: UILabel!
    @IBOutlet weak var lbl_n_alignment: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonRequest()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonRequest()->Void
    {
        let url = URL(string:"https://superheroapi.com/api.php/1884296995001305/346/biography")
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let iron_man = try? JSONDecoder().decode(IronMan.self, from: data)
                    else{
                        print("Error: Can't decode in your variable")
                        return
                }
                print("name: \(iron_man.name!)")
                print("full_name: \(iron_man.full_name!)")
                print("first_appearance: \(iron_man.first_appearance!)")
                print("publisher: \(iron_man.publisher!)")
                print("birth_place: \(iron_man.place_of_birth!)")
                print("alter_egos: \(iron_man.alter_egos!)")
                print("alignment: \(iron_man.alignment!)")
                DispatchQueue.main.sync{
                    if let im_name = iron_man.name{
                        self.lbl_title.text = im_name
                    }
                    
                    if let im_full_name = iron_man.full_name{
                        self.lbl_name.text = im_full_name
                    }
                    
                    if let im_first_appearance = iron_man.first_appearance{
                        self.lbl_first_appear.text = im_first_appearance
                    }
                    
                    if let im_publisher = iron_man.publisher{
                        self.lbl_publisher.text = im_publisher
                    }
                    
                    if let im_birth_place = iron_man.place_of_birth{
                        self.lbl_birth_place.text = im_birth_place
                    }
                    
                    if let im_alter_egos = iron_man.alter_egos{
                        self.lbl_alter.text = im_alter_egos
                    }
                    
                    if let im_alignment = iron_man.alignment{
                        self.lbl_alignment.text = im_alignment
                    }
                }
                   }
                catch let error as NSError {
                print(error)
            }
        }).resume()
            
     }
    
        
   
}

