//
//  HighScoreTableViewController.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 12/26/20.
//

import UIKit

class HighScoreViewController: UITableViewController {

    var items = [HighScoreItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    
    
    //MARK:- Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
