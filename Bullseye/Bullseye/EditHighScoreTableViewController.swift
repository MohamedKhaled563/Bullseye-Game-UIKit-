//
//  EditHighScoreTableViewController.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 1/7/21.
//

import UIKit

protocol EditHighScoreViewControllerDelegate: class {
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreTableViewController)
    func editHighScoreViewController(_ controller: EditHighScoreTableViewController, didFinishedEditing item: HighScoreItem)
}


class EditHighScoreTableViewController: UITableViewController, UITextFieldDelegate {

    weak var delegate: EditHighScoreViewControllerDelegate?
    var highScoreItem: HighScoreItem!
        
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = highScoreItem.name
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //MARK:- Actions
    
    @IBAction func done(_ sender: Any) {
        delegate?.editHighScoreViewController(self, didFinishedEditing: highScoreItem)
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.editHighScoreViewControllerDidCancel(self)
    }
    
    //MARK:- UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneBarButton.isEnabled = !newText.isEmpty
        highScoreItem.name = newText
        return true
    }
}

