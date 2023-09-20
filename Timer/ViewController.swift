//
//  ViewController.swift
//  Timer
//
//  Created by clark on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    var countdown: Int = 0

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func select30seconds(){
        countdown = 30
      startTimer(time: 30)
        
    }
    
    @IBAction func select1minutes(){
        countdown = 60
        startTimer(time: 60)
    }
    
    @IBAction func select5minutes(){
        countdown = 300
        startTimer(time: 300)
    }
    
    @IBAction func select10minutes(){
        countdown = 600
        startTimer(time: 600)
    }
    
    
    @objc func onTimerCalled() {
        
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        
        label.text = String(format: "%02d:%02d",remainingMinutes,remainingSeconds )
        
        countdown -= 1
        
        if countdown < 0 {
            let stopAlert = UIAlertController(title: "タイマーが終了しました",
                                              message: nil,
                                              preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            stopAlert.addAction(okAction)
            present(stopAlert,animated:  true)
            timer.invalidate()
        }
    }

    func startTimer(time: Int){
        if timer != nil {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(onTimerCalled),
                                     userInfo: nil,
                                     repeats: true)
        timer.fire()
    }
}

