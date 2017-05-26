//
//  EditWordPairViewController.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 29/04/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite

class EditWordPairViewController: UIViewController {
    @IBOutlet weak var editWordOne: UITextField!
    @IBOutlet weak var editWordTwo: UITextField!
    @IBOutlet weak var editType: UITextField!
    @IBOutlet weak var editNote: UITextField!
    @IBOutlet weak var editImage: UITextField!
    @IBOutlet weak var editImageURL: UITextField!
    @IBOutlet weak var editImageCredit: UITextField!
    @IBOutlet weak var editImageLicense: UITextField!
    
    @IBOutlet weak var editTag: UITextField!
    var newWordPair = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        iniDB()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNew(_ sender: AnyObject) {
        if let paraWordOne = self.editWordOne?.text {
            newWordPair["wordOne"] = paraWordOne
        } else {
            newWordPair["wordOne"] = ""
        }
        
        if let paraWordTwo = self.editWordTwo?.text {
            newWordPair["wordTwo"] = paraWordTwo
        } else {
            newWordPair["wordTwo"] = ""
        }
        
        if let paraType = self.editType?.text {
            newWordPair["type"] = paraType
        } else {
            newWordPair["type"] = ""
        }
        
        if let paraNote = self.editNote?.text {
            newWordPair["note"] = paraNote
        } else {
            newWordPair["note"] = ""
        }
        
        if let paraImage = self.editImage?.text {
            newWordPair["image"] = paraImage
        } else {
            newWordPair["image"] = ""
        }
        
        if let paraImageURL = self.editImageURL?.text {
            newWordPair["imageurl"] = paraImageURL
        } else {
            newWordPair["imageurl"] = ""
        }
        
        if let paraImageCredit = self.editImageCredit?.text {
            newWordPair["imagecredit"] = paraImageCredit
        } else {
            newWordPair["imagecredit"] = ""
        }
        
        if let paraImageLicense = self.editImageLicense?.text {
            newWordPair["imagelicense"] = paraImageLicense
        } else {
            newWordPair["imagelicense"] = ""
        }
        
        if let paraTag = self.editTag?.text {
            newWordPair["tag"] = paraTag
        } else {
            newWordPair["tag"] = ""
        }
        
        let insert = theWordPair.insert(or: .replace, wordone <- newWordPair["wordOne"]!,
                                        wordtwo <- newWordPair["wordTwo"]!,
                                        type <- newWordPair["type"]!,
                                        note <- newWordPair["note"]!,
                                        image <- newWordPair["image"]!,
                                        imageurl <- newWordPair["imageurl"]!,
                                        imagecredit <- newWordPair["imagecredit"]!,
                                        imagelicense <- newWordPair["imagelicense"]!,
                                        tag <- newWordPair["tag"]!)
        try! db?.run(insert)
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
