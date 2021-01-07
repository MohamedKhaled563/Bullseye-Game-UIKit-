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
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal,
                             for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right:
        14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
        var points = 100 - difference
        
        let title: String
        if (difference == 0){
            title = "Perfect!"
            // Adding 100 bonus points
            points += 100
        }
        else if difference < 5{
            title = "You almost had it!"
            // Add 50 bonus points if difference is 1
            if (difference == 1){
                points += 50
            }
        }
        else if difference < 10{
            title = "Pretty good!"
        }
        else{
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points)"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title:"cancel",
                                   style: .default){_ in
            self.startNewRound()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startNewGame(){
        addHighScore(score)
        score = 0
        round = 0
        startNewRound()
    }
    
    func addHighScore(_ score: Int){
        guard (score > 0) else{
            return
        }
        let highscore = HighScoreItem()
        highscore.name = "Unknown"
        highscore.score = score
        var highScores = PersistencyHelper.loadHighScores()
        highScores.append(highscore)
        highScores.sort(by: {$0.score > $1.score})
        PersistencyHelper.saveHighScores(highScores)
    }

    
}

