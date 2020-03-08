//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var C: UIButton!
    
    @IBOutlet weak var D: UIButton!
    var player: AVAudioPlayer!
    var i = 0
    @IBOutlet weak var E: UIButton!
    
    @IBOutlet weak var F: UIButton!
    
    @IBOutlet weak var G: UIButton!
    
    @IBOutlet weak var A: UIButton!
    
    @IBOutlet weak var B: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {

        playSound(soundName: sender.currentTitle!)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
    }
    var timeF:Timer?
    
    
    @IBAction func playMu(_ sender: Any) {
        var t = DispatchTime.now()
        var muArr:[UIButton] = [C,C,G,G,A,A,G,F,F,E,E,D,D,C]
            i=0
         timeF = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(callback), userInfo: nil, repeats: true)
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(i), execute: {
//                self.keyPressed(muArr[i])
//                print(t + .seconds(i))
//                //print(t)
//            })
            
        
            
        
        

        }

    @objc func callback()
    {
        
        var muArr:[UIButton] = [C,C,G,G,A,A,G,F,F,E,E,D,D,C]
        keyPressed(muArr[i])
        i+=1
        if i>muArr.count-1
        {
            timeF!.invalidate()
        }
    }

    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        
            self.player.play()
        
    }
    
}








