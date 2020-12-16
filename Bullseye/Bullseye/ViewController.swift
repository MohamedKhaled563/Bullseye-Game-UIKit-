//
//  ViewController.swift
//  Bullseye
//
//  Created by Mohamed Khalid on 12/11/20.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var roundLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
    }

    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updataLables()
    }
    
    func updataLables(){
        targetLable.text = String(targetValue)
        scoreLable.text = String(score)
        roundLable.text = String(round)
    }
    
    
    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let message = "You scored \(points)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"cancel",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }


    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    

    
}

