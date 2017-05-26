//
//  DownloadJSONViewController.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 05/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SwiftyJSON
import SQLite

class DownloadJSONViewController: UIViewController {
    
    @IBOutlet weak var urlTextf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dwonLoadJSON(_ sender: AnyObject) {

        let urlString = urlTextf.text!
//        let urlString = "http://users.aber.ac.uk/nst/m2220/words.json"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let json = JSON(data: data!)
//                    print(parsedData)
                    let array = json["wordpairs"]
//                    print(array)
                    for (_,subJson):(String,JSON) in array {
                        
                        let insert = theWordPair.insert(or: .replace,
                                                        wordone <- subJson["wordPhraseOne"].stringValue,
                                                        wordtwo <- subJson["wordPhraseTwo"].stringValue,
                                                        type <- subJson["type"].stringValue,
                                                        note <- subJson["note"].stringValue,
                                                        image <- subJson["image"].stringValue,
                                                        imageurl <- subJson["imageSourceUrl"].stringValue,
                                                        imagecredit <- subJson["imageCredit"].stringValue,
                                                        imagelicense <- subJson["imageLicense"].stringValue,
                                                        tag <- subJson["tag"].stringValue)
                        try! db?.run(insert)
                    }

                    
//                    let currentConditions = parsedData["currently"] as! [String:Any]
//                    
//                    print(currentConditions)
//                    
//                    let currentTemperatureF = currentConditions["temperature"] as! Double
//                    print(currentTemperatureF)
                }
            }
            
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
