//
//  json_cap_america.swift
//  Comics
//
//  Created by Mac on 30/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

struct CapAmerica: Codable{
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
extension CapAmerica{
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
class json_cap_america: UIViewController {

    @IBOutlet weak var lbl_title_3: UILabel!
    @IBOutlet weak var lbl_name_3: UILabel!
    @IBOutlet weak var lbl_first_appear_3: UILabel!
    @IBOutlet weak var lbl_publisher_3: UILabel!
    @IBOutlet weak var lbl_info_3: UILabel!
    @IBOutlet weak var lbl_birth_place_3: UILabel!
    @IBOutlet weak var lbl_alter_3: UILabel!
    @IBOutlet weak var lbl_alignment_3: UILabel!
    
    
    @IBOutlet weak var lbl_n_name_3: UILabel!
    @IBOutlet weak var lbl_n_first_appear_3: UILabel!
    @IBOutlet weak var lbl_n_publisher_3: UILabel!
    @IBOutlet weak var lbl_n_birth_place: UILabel!
    @IBOutlet weak var lbl_n_alter_3: UILabel!
    @IBOutlet weak var lbl_n_alignment_3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonRequest_4()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonRequest_4()->Void
    {
        let url = URL(string:"https://superheroapi.com/api.php/1884296995001305/149/biography")
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let cap_america = try? JSONDecoder().decode(CapAmerica.self, from: data)
                    else{
                        print("Error: Can't decode in your variable")
                        return
                }
                print("name: \(cap_america.name!)")
                print("full_name: \(cap_america.full_name!)")
                print("first_appearance: \(cap_america.first_appearance!)")
                print("publisher: \(cap_america.publisher!)")
                print("birth_place: \(cap_america.place_of_birth!)")
                print("alter_egos: \(cap_america.alter_egos!)")
                print("alignment: \(cap_america.alignment!)")
                DispatchQueue.main.sync{
                    if let ca_name = cap_america.name{
                        self.lbl_title_3.text = ca_name
                    }
                    
                    if let ca_full_name = cap_america.full_name{
                        self.lbl_name_3.text = ca_full_name
                    }
                    
                    if let ca_first_appearance = cap_america.first_appearance{
                        self.lbl_first_appear_3.text = ca_first_appearance
                    }
                    
                    if let ca_publisher = cap_america.publisher{
                        self.lbl_publisher_3.text = ca_publisher
                    }
                    
                    if let ca_birth_place = cap_america.place_of_birth{
                        self.lbl_birth_place_3.text = ca_birth_place
                    }
                    
                    if let ca_alter_egos = cap_america.alter_egos{
                        self.lbl_alter_3.text = ca_alter_egos
                    }
                    
                    if let ca_alignment = cap_america.alignment{
                        self.lbl_alignment_3.text = ca_alignment
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
            
            
        }).resume()
    }

}
