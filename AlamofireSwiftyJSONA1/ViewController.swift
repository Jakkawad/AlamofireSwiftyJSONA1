//
//  ViewController.swift
//  AlamofireSwiftyJSONA1
//
//  Created by Jakkawad Chaiplee on 10/2/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var sName:String!
    var sFilm = [String]()
    
    func loadJSON(completed:@escaping DownloadComplete) {
        let forecastURL = URL(string: BASE_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                let name = json["name"].stringValue
//                print("Name: \(name)")
//                var films = json["films"].array
//                print("Films: \(films)")
//                for film in films! {
//                    print("Film: \(film)")
//                    sFilm.append(film)
//                }
                if let items = json["films"].array {
//                    print("items: \(items)")
                    var films = Array<String>()
                    for item in items {
                        self.sFilm.append(item.stringValue)
//                        if let title = item["films"].string {
//                            print(title)
//                        }
//                        print("item: \(item)")
                        print("sFilms: \(self.sFilm)")
                    }
                }
                
//                // Films
//                if let jsonArray = json[SpeciesFields.Films.rawValue].array {
//                    self.films = Array<String>()
//                    for entry in jsonArray {
//                        self.films?.append(entry.stringValue)
//                    }
//                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJSON {
            //print("JSON")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

