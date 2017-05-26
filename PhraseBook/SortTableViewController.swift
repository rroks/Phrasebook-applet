//
//  SortTableViewController.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 26/04/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite

class SortTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    @IBOutlet var searchBar: UISearchBar!

    @IBOutlet var SortTableView: UITableView!
    var all: Array<Row>!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchResult: Array<Row>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        all = Array(try! db!.prepare(theWordPair.order(wordone.asc)))
        searchResult = all
        
//        let nib = UINib(nibName: "WordCell", bundle: nil)
//        self.SortTableView.register(nib, forCellReuseIdentifier:"WordCell")
//        self.SortTableView.register(UITableViewCell.self, forCellReuseIdentifier: "WordCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        all = Array(try! db!.prepare(theWordPair.order(wordone.asc)))
        searchResult = all
        self.SortTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchResult = []
        
        for word in all{
            if word[wordone].lowercased().hasPrefix(searchText.lowercased()){
               self.searchResult.append(word)
            }
        }
        print(self.searchResult)
        self.SortTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.SortTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        let rowNum = try? db!.scalar(theWordPair.count)
//        searchResult.count
        return searchResult.count
    }


//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell") as UITableViewCell!
        cell.textLabel?.text = searchResult[indexPath.row][wordone]
        cell.detailTextLabel?.text = searchResult[indexPath.row][wordtwo]
//        var cell:UITableViewCell? =
//            tableView.dequeueReusableCell(withIdentifier: "WordCell")
//        if (cell == nil)
//        {
//            cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
//                                   reuseIdentifier: "WordCell")
//        }
//        cell!.textLabel!.text = "cell \(indexPath.section),\(indexPath.row)"
//        cell!.detailTextLabel?.text = "some text"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
//        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
            case "DisSegue":
                if let namerScreen = segue.destination as? DisplayWordPair {
                    let path = self.SortTableView.indexPathForSelectedRow
                    let cell = self.SortTableView.cellForRow(at: path!)
                    namerScreen.wordoneSegue = (cell?.textLabel?.text!)!
                    namerScreen.wordtwoSegue = (cell?.detailTextLabel?.text!)!
                    namerScreen.typeSegue = searchResult[(path?.row)!][type]
                    namerScreen.noteSegue = searchResult[(path?.row)!][note]
                    namerScreen.imageSegue = searchResult[(path?.row)!][image]
                    namerScreen.creditSegue = searchResult[(path?.row)!][imagecredit]
                    namerScreen.licenseSegue = searchResult[(path?.row)!][imagelicense]
                    namerScreen.urlSegue = searchResult[(path?.row)!][imageurl]
                }
//        let indexPath = SortTableView.indexPath(for: namerScreen)
//        let cell = SortTableView.dequeueReusableCell(withIdentifier: "WordCell")
//        namerScreen?.wordone.detailTextLabel?.text = "1111"
            default:
                fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "DisplaySegue", sender: self)
//    }

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
