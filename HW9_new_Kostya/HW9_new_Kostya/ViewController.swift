//
//  ViewController.swift
//  27.09
//
//  Created by Ant Zy on 28.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movingСircleView: UIView!
    @IBOutlet weak var horseImage: UIImageView!
    @IBOutlet weak var fieldImage: UIImageView!
    
    @IBOutlet weak var startStopLabel: UILabel!
    @IBOutlet weak var hippodromeView: UIView!
    
    var timer: Timer?
    var time: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movingСircleView.layer.cornerRadius = movingСircleView.frame.width / 2
        hippodromeView.layer.cornerRadius = hippodromeView.frame.width / 8
        fieldImage.layer.cornerRadius = hippodromeView.frame.width / 8
    }
    
    @objc func raceTimer() {
        
        time += 1
        horseImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi*2.0)
        if movingСircleView.frame.maxX < hippodromeView.frame.width && movingСircleView.frame.minY == 0  {
            movingСircleView.frame = CGRect(x: movingСircleView.frame.minX + 1, y: movingСircleView.frame.minY, width: movingСircleView.frame.width, height: movingСircleView.frame.height)
        } else if movingСircleView.frame.maxY < hippodromeView.frame.height && movingСircleView.frame.maxX == hippodromeView.frame.width {
            movingСircleView.frame = CGRect(x: movingСircleView.frame.minX, y: movingСircleView.frame.minY + 1, width: movingСircleView.frame.width, height: movingСircleView.frame.height)
            horseImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        } else if movingСircleView.frame.minX > 0 {
            horseImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            movingСircleView.frame = CGRect(x: movingСircleView.frame.minX - 1, y: movingСircleView.frame.minY, width: movingСircleView.frame.width, height: movingСircleView.frame.height)
        } else if movingСircleView.frame.minX == 0 && movingСircleView.frame.minY >= 0 {
            horseImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi*1.5)
            movingСircleView.frame = CGRect(x: movingСircleView.frame.minX, y: movingСircleView.frame.minY - 1, width: movingСircleView.frame.width, height: movingСircleView.frame.height)
            
        }
    }
    
    func setTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 0.005,
                                         target: self,
                                         selector: #selector(raceTimer),
                                         userInfo: nil,
                                         repeats: true)
        self.timer = timer
    }
    
    func resetTimer(){
        timer?.invalidate()
        time = 0
    }
    
    @IBAction func actionStartStop(_ sampleSwitch: UISwitch) {
        if sampleSwitch.isOn {
            setTimer()
            startStopLabel.text = "Идет забег"
        }
        else {
            resetTimer()
            startStopLabel.text = "Забег остановлен"
        }
    }
}

