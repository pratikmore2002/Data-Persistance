//
//  ViewController.swift
//  PropertyList
//
//  Created by Neosoft on 09/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    struct Settings : Codable{
        var imageURL : String
        var color : Int
        
        private enum CodingKeys : String, CodingKey {
            case imageURL = "image"
            case color
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let settings = self.getSettings(){
            let colorName = String(format: "customBlue", settings.color)
            view.backgroundColor = UIColor(named: colorName)
            imageView.image = UIImage(named: settings.imageURL )
            
        }
        
    }
    func getSettings() -> Settings? {
        let decoder = PropertyListDecoder()
         
        if let url = Bundle.main.url(forResource: "Settings", withExtension: "plist"){
            if let data = try? Data(contentsOf: url)
            {
                if let settings = try? decoder.decode(Settings.self, from: data)
                {
                    return settings
                }
            }
        }
        return nil
    }

}

