//
//  DBpara.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 04/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import Foundation
import SQLite

//var path = NSSearchPathForDirectoriesInDomains(
//    .applicationSupportDirectory, .userDomainMask, true
//    ).first! + Bundle.main.bundleIdentifier!
//try? FileManager.default.createDirectory(
//    atPath: path, withIntermediateDirectories: true, attributes: nil
//)
//let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//let db = try? Connection("\(path)/phrasebook.sqlite")

let db = try? Connection("/Users/Rroks/MBSolution/Phra/PhraseBook/phrasebook.sqlite")
let theWordPair = Table("PHRASEBOOK")
let wordone = Expression<String>("WORDONE")
let wordtwo = Expression<String>("WORDTWO")
let type = Expression<String>("TYPE")
let note = Expression<String>("NOTE")
let image = Expression<String>("IMAGE")
let imageurl = Expression<String>("IMAGEURL")
let imagecredit = Expression<String>("IMAGECREDIT")
let imagelicense = Expression<String>("IMAGELICENSE")
let tag = Expression<String>("TAG")

//func iniDB() {
//    try! db?.run(theWordPair.create {t in
//        t.column(wordone)
//        t.column(wordtwo)
//        t.column(type)
//        t.column(note)
//        t.column(image)
//        t.column(imageurl)
//        t.column(imagecredit)
//        t.column(imagelicense)
//        t.column(tag)
//        t.primaryKey(wordone, wordtwo)
//    })
//}
