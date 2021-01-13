//
//  HighScoreTableViewController.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 12/26/20.
//

import UIKit

class HighScoreViewController: UITableViewController, EditHighScoreViewControllerDelegate {

    var items = [HighScoreItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        items = PersistencyHelper.loadHighScores()
        if (items.count == 0){
            resetHighscoreItems()
        }
        
        print("Data path file directory: \(PersistencyHelper.dataFilePath())")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editHighScoreController = segue.destination as! EditHighScoreTableViewController
        editHighScoreController.delegate = self
        if let highScoreItem = tableView.indexPath(for: sender as! UITableViewCell){
            editHighScoreController.highScoreItem = items[highScoreItem.row]
        }
    }
    
    
    // MARK:- Actions
    @IBAction func resetHighscoreItems(){
        items.removeAll()
        let item1 = HighScoreItem()
        item1.name = "The reader of this book"
        item1.score = 50000
        items.append(item1)
        let item2 = HighScoreItem()
        item2.name = "Manda"
        item2.score = 10000
        items.append(item2)
        let item3 = HighScoreItem()
        item3.name = "Joey"
        item3.score = 5000
        items.append(item3)
        let item4 = HighScoreItem()
        item4.name = "Adam"
        item4.score = 1000
        items.append(item4)
        let item5 = HighScoreItem()
        item5.name = "Eli"
        item5.score = 500
        items.append(item5)
        tableView.reloadData()
        PersistencyHelper.saveHighScores(items)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreCell", for: indexPath)
        
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        
        let item = items[indexPath.row]
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
        PersistencyHelper.saveHighScores(items)
    }

    
    //MARK:- Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK:- Edit High Score View Controller Delegate
    
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func editHighScoreViewController(_ controller: EditHighScoreTableViewController, didFinishedEditing item: HighScoreItem) {
        if let arrayIndex = items.firstIndex(of: item){
            let indexPath = IndexPath(row: arrayIndex, section: 0)
            let indexPaths = [indexPath]
            tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        PersistencyHelper.saveHighScores(items)
        navigationController?.popViewController(animated: true)
    }

}
