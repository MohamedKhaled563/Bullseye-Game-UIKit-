//
//  EditHighScoreTableViewController.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 1/7/21.
//

import UIKit

class EditHighScoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    //MARK:- Actions
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

