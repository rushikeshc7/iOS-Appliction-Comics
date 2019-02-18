//
//  json_superman.swift
//  Comics
//
//  Created by Mac on 30/12/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

struct SuperMan: Codable{
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
extension SuperMan{
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
class json_superman: UIViewController {
    
    @IBOutlet weak var lbl_title_2: UILabel!
    @IBOutlet weak var lbl_name_2: UILabel!
    @IBOutlet weak var lbl_first_appear_2: UILabel!
    @IBOutlet weak var lbl_info_2: UILabel!
    @IBOutlet weak var lbl_publisher_2: UILabel!
    @IBOutlet weak var lbl_birth_place_2: UILabel!
    @IBOutlet weak var lbl_alter_2: UILabel!
    @IBOutlet weak var lbl_alignment_2: UILabel!
    
    
    @IBOutlet weak var lbl_n_name_2: UILabel!
    @IBOutlet weak var lbl_n_first_appear_2: UILabel!
    @IBOutlet weak var lbl_n_publisher_2: UILabel!
    @IBOutlet weak var lbl_n_birth_place_2: UILabel!
    @IBOutlet weak var lbl_n_alter_2: UILabel!
    @IBOutlet weak var lbl_n_alignment_2: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonRequest_2()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonRequest_2()->Void
    {
        let url = URL(string:"https://superheroapi.com/api.php/1884296995001305/644/biography")
        
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
               guard let superman = try? JSONDecoder().decode(SuperMan.self, from: data)
                else{
                    print("Error: Can't decode in your variable")
                    return
                }
                print("name: \(superman.name!)")
                print("full_name: \(superman.full_name!)")
                print("first_appearance: \(superman.first_appearance!)")
                print("publisher: \(superman.publisher!)")
                print("birth_place: \(superman.place_of_birth!)")
                print("alter_egos: \(superman.alter_egos!)")
                print("alignment: \(superman.alignment!)")
                DispatchQueue.main.sync{
                    if let s_name = superman.name{
                        self.lbl_title_2.text = s_name
                    }
                    
                    if let s_full_name = superman.full_name{
                        self.lbl_name_2.text = s_full_name
                    }
                    
                    if let s_first_appearance = superman.first_appearance{
                        self.lbl_first_appear_2.text = s_first_appearance
                    }
                    
                    if let s_publisher = superman.publisher{
                        self.lbl_publisher_2.text = s_publisher
                    }
                    
                    if let s_birth_place = superman.place_of_birth{
                        self.lbl_birth_place_2.text = s_birth_place
                    }
                    
                    if let s_alter_egos = superman.alter_egos{
                        self.lbl_alter_2.text = s_alter_egos
                    }
                    
                    if let s_alignment = superman.alignment{
                        self.lbl_alignment_2.text = s_alignment
                    }
                }
            }
            catch let error as NSError {
                print(error)
            }
            
            
        }).resume()
    }

}
