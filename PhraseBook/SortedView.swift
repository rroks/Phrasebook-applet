//
//  SortedView.swift
//  PhraseBook
//
//  Created by Yufeng Chen on 07/05/2017.
//  Copyright © 2017 yuc. All rights reserved.
//

import UIKit
import SQLite

class SortedView: UITableViewController {
    @IBOutlet var StableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var all: Array<Row>!
    var searchResult: Array<Row>!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        all = Array(try! db!.prepare(theWordPair.order(wordone.asc)))
        searchResult = all
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        StableView.tableHeaderView = searchController.searchBar
        
    }

    override func viewWillAppear(_ animated: Bool) {
        all = Array(try! db!.prepare(theWordPair.order(wordone.asc)))
        searchResult = all
        self.StableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searchController.isActive && searchController.searchBar.text != "" {
//            return searchResult.count
//        }
        return searchResult.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TBCell", for: indexPath)
        cell.textLabel?.text = searchResult[indexPath.row][wordone]
        cell.detailTextLabel?.text = searchResult[indexPath.row][wordtwo]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        switch(segue.identifier ?? "") {
        case "DisSegue":
            if let namerScreen = segue.destination as? DisplayWordPair {
                let path = self.StableView.indexPathForSelectedRow
                let cell = self.StableView.cellForRow(at: path!)
                namerScreen.wordoneSegue = (cell?.textLabel?.text!)!
                namerScreen.wordtwoSegue = (cell?.detailTextLabel?.text!)!
                namerScreen.typeSegue = searchResult[(path?.row)!][type]
                namerScreen.noteSegue = searchResult[(path?.row)!][note]
                namerScreen.imageSegue = searchResult[(path?.row)!][image]
                namerScreen.creditSegue = searchResult[(path?.row)!][imagecredit]
                namerScreen.licenseSegue = searchResult[(path?.row)!][imagelicense]
                namerScreen.urlSegue = searchResult[(path?.row)!][imageurl]
            }
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        searchResult = all.filter { word in
            return word[wordone].lowercased().hasPrefix(searchText.lowercased())
        }
        tableView.reloadData()
    }
}

extension SortedView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
