//
//  ViewController.swift
//  ClockApp
//
//  Created by Halle Paulk on 1/29/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var countdownPicker: UIDatePicker!
    
    @IBOutlet weak var timerButton: UIButton!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    var timer: Timer?
    var audioPlayer: AVAudioPlayer?
    var remainingTime: TimeInterval = 0
    

    override func viewDidLoad() {
        countdownPicker.backgroundColor = UIColor.cyan
        countdownPicker.layer.borderWidth = 5.0
        countdownPicker.layer.borderColor = UIColor.black.cgColor
        countdownPicker.layer.cornerRadius = 5.0
        super.viewDidLoad()
        updateClock()
        startClockTimer()
    }

    func updateClock() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss"
        let currentTime = dateFormatter.string(from: Date())
        label1.text = currentTime
        
        // Change background image based on AM/PM
        let hour = Calendar.current.component(.hour, from: Date())
        let isAM = hour < 12
        if isAM {
            backgroundImageView.image = UIImage(named: "AM") // Set morning background image
        } else {
            backgroundImageView.image = UIImage(named: "PM") // Set night background image
        }
    }
    
    func startClockTimer() {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.updateClock()
            }
    }
    
    @IBAction func timerButtonTapped(_ sender: UIButton) {
        if timer == nil {
               startTimer()
           } else {
               stopTimer()
           }
    }
    
    @IBAction func countdownPickerValueChanged(_ sender: UIDatePicker) {
        let countDownDuration = sender.countDownDuration
        print("Selected countdown duration: \(countDownDuration)")
        remainingTime = countDownDuration
        updateLabel2(time: countDownDuration)
    }

    
    func startTimer() {
        let countDownDuration = countdownPicker.countDownDuration
        print("Selected countdown duration: \(countDownDuration)")
        remainingTime = countDownDuration
        updateLabel2(time: countDownDuration)

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.remainingTime -= 1
            DispatchQueue.main.async {
                self.updateLabel2(time: self.remainingTime)
            }
            if self.remainingTime <= 0 {
                timer.invalidate()
                self.playMusic()
                self.timerButton.setTitle("Stop Music", for: .normal)
                print("Timer ended. Music started.")
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
        remainingTime = 0
        label2.text = "Time Remaining: 00:00:00"
        timerButton.setTitle("Start Timer / Stop Music", for: .normal) // Change button text back to original state
        stopMusic()
        print("Timer stopped. Music stopped. Ready to start a new timer.")
    }

    func updateLabel2(time: TimeInterval) {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        label2.text = "Time Remaining: " + String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func playMusic() {
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else {
                print("Error: Audio file not found")
                return
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self // Set the delegate to handle audio playback events (optional)
                audioPlayer?.play()
            } catch {
                print("Error playing music: \(error.localizedDescription)")
            }
    }

    func stopMusic() {
        audioPlayer?.stop()
    }

}
