//
//  TagView.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 06/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite

class TagView: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var TagTable: UITableView!

    var all: Array<Row>!
    var tagNames: Array<Row>!
    let tags = theWordPair.select(tag)
        .group(tag)
        .order(tag.asc)
    
    var tagArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        all = Array(try! db!.prepare(theWordPair))
        tagNames = Array(try! db!.prepare(tags))
//        print(tag)
        rowToArray()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.TagTable.reloadData()
    }
    
    func rowToArray(){
        var temp = ""
        for str in tagNames {
//            print(str)
            temp = str[tag]
//            print(temp)
            tagArray.append(temp)
//            print(str[wordone])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return tagNames.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tagContent = theWordPair.where(tag == tagArray[section])
        all = Array(try! db!.prepare(tagContent))
        return all.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagCell", for: indexPath)
        let tagContent = theWordPair.where(tag == tagArray[indexPath.section])
        all = Array(try! db!.prepare(tagContent))
        cell.textLabel?.text = all[indexPath.row][wordone]
        cell.detailTextLabel?.text = all[indexPath.row][wordtwo]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        var tagTitle = ""
        if tagArray[section] == "" {
            tagTitle = "No tag"
        } else {
            tagTitle = tagArray[section]
        }
        return tagTitle
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        //        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "DisSegue":
            if let namerScreen = segue.destination as? DisplayWordPair {
                let path = self.TagTable.indexPathForSelectedRow
                let cell = self.TagTable.cellForRow(at: path!)
                namerScreen.wordoneSegue = (cell?.textLabel?.text!)!
                namerScreen.wordtwoSegue = (cell?.detailTextLabel?.text!)!
                namerScreen.typeSegue = all[(path?.row)!][type]
                namerScreen.noteSegue = all[(path?.row)!][note]
                namerScreen.imageSegue = all[(path?.row)!][image]
                namerScreen.creditSegue = all[(path?.row)!][imagecredit]
                namerScreen.licenseSegue = all[(path?.row)!][imagelicense]
                namerScreen.urlSegue = all[(path?.row)!][imageurl]
            }
            //        let indexPath = SortTableView.indexPath(for: namerScreen)
            //        let cell = SortTableView.dequeueReusableCell(withIdentifier: "WordCell")
        //        namerScreen?.wordone.detailTextLabel?.text = "1111"
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
