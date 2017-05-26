//
//  Test.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 05/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite

class Test: UIViewController {

    @IBOutlet weak var anwser: UILabel!
    @IBOutlet weak var word: UILabel!
    
    var anwserTemp:String? = ""
    var total = 0
    var all: Array<Row>!
    var randomRoll = 0
    var count = 0
    
    @IBAction func displayWordTwo(_ sender: AnyObject) {
        anwser.text = anwserTemp
    }
    @IBAction func nextWord(_ sender: AnyObject) {
//        all = Array(try! db!.prepare(theWordPair))
//        total = try! db!.scalar(theWordPair.count)
//        randomRoll = Int(arc4random_uniform(UInt32(total))) + 1
//        count = 0
//        for getWord in all {
//            count += 1
//            if count == randomRoll {
//                word.text = getWord[wordone]
//                anwserTemp = getWord[wordtwo]
//            }
//        }
        loadWord()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWord()
//        all = Array(try! db!.prepare(theWordPair))
//        total = try! db!.scalar(theWordPair.count)
//        randomRoll = Int(arc4random_uniform(UInt32(total))) + 1
//        count = 0
//        for getWord in all {
//            count += 1
//            if count == randomRoll {
//                word.text = getWord[wordone]
//                anwserTemp = getWord[wordtwo]
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        total = try! db!.scalar(theWordPair.count)
        all = Array(try! db!.prepare(theWordPair))
    }
    
    func loadWord() {
        all = Array(try! db!.prepare(theWordPair))
        total = try! db!.scalar(theWordPair.count)
        randomRoll = Int(arc4random_uniform(UInt32(total))) + 1
        count = 0
        for getWord in all {
            count += 1
            if count == randomRoll {
                word.text = getWord[wordone]
                anwserTemp = getWord[wordtwo]
            }
        }
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
