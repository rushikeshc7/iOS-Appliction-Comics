//
//  json_batman.swift
//  Comics
//
//  Created by Mac on 30/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

struct BatMan: Codable{
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
extension BatMan{
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
class json_batman: UIViewController {

    
    @IBOutlet weak var lbl_title_1: UILabel!
    @IBOutlet weak var lbl_name_1: UILabel!
    @IBOutlet weak var lbl_first_appear_1: UILabel!
    @IBOutlet weak var lbl_publisher_1: UILabel!
    @IBOutlet weak var lbl_info_1: UILabel!
    @IBOutlet weak var lbl_birth_place_1: UILabel!
    @IBOutlet weak var lbl_alter_1: UILabel!
    @IBOutlet weak var lbl_alignment_1: UILabel!
    
    
    @IBOutlet weak var lbl_n_name_1: UILabel!
    @IBOutlet weak var lbl_n_first_appear: UILabel!
    @IBOutlet weak var lbl_n_publisher_1: UILabel!
    @IBOutlet weak var lbl_n_birth_place_1: UILabel!
    @IBOutlet weak var lbl_n_alter_1: UILabel!
    @IBOutlet weak var lbl_n_alignment_1: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonRequest_1()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonRequest_1()->Void
    {
        let url = URL(string:"https://superheroapi.com/api.php/1884296995001305/70/biography")
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
           
            do {
                guard let batman = try? JSONDecoder().decode(BatMan.self, from: data)
                    else{
                        print("Error: Can't decode in your variable")
                        return
                }
                print("name: \(batman.name!)")
                print("full_name: \(batman.full_name!)")
                print("first_appearance: \(batman.first_appearance!)")
                print("publisher: \(batman.publisher!)")
                print("birth_place: \(batman.place_of_birth!)")
                print("alter_egos: \(batman.alter_egos!)")
                print("alignment: \(batman.alignment!)")
                DispatchQueue.main.sync{
                    if let b_name = batman.name{
                        self.lbl_title_1.text = b_name
                    }
                    
                    if let b_full_name = batman.full_name{
                        self.lbl_name_1.text = b_full_name
                    }
                    
                    if let b_first_appearance = batman.first_appearance{
                        self.lbl_first_appear_1.text = b_first_appearance
                    }
                    
                    if let b_publisher = batman.publisher{
                        self.lbl_publisher_1.text = b_publisher
                    }
                    
                    if let b_birth_place = batman.place_of_birth{
                        self.lbl_birth_place_1.text = b_birth_place
                    }
                    
                    if let b_alter_egos = batman.alter_egos{
                        self.lbl_alter_1.text = b_alter_egos
                    }
                    
                    if let b_alignment = batman.alignment{
                        self.lbl_alignment_1.text = b_alignment
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
            
            
        }).resume()
    }

}
