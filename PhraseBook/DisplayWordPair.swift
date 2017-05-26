//
//  DisplayWordPair.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 04/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite
import SDWebImage

class DisplayWordPair: UIViewController {

    @IBOutlet weak var dpWordone: UILabel!
    @IBOutlet weak var dpWordtwo: UILabel!
    @IBOutlet weak var dpType: UILabel!
    @IBOutlet weak var dpNote: UILabel!
    @IBOutlet weak var dpImage: UILabel!
    @IBOutlet weak var dpCredit: UILabel!
    @IBOutlet weak var dpLicense: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var wordoneSegue = ""
    var wordtwoSegue = ""
    var typeSegue = ""
    var noteSegue = ""
    var imageSegue = ""
    var creditSegue = ""
    var licenseSegue = ""
    var urlSegue = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dpWordone.text = wordoneSegue
        dpWordtwo.text = wordtwoSegue
        dpType.text = typeSegue
        dpNote.text = noteSegue
        dpImage.text = imageSegue
        dpCredit.text = creditSegue
        dpLicense.text = licenseSegue
        
//        let imageURLtest = "http://users.aber.ac.uk/nst/m2220/school.jpg"
        imageView.sd_setImage(with: URL(string: urlSegue), placeholderImage: UIImage(named: imageSegue))
//        print(imageURLtest)
        // Do any additional setup after loading the view.
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
