/*:
 ## **Discover Naples**
 Surely you have dealt with stereotypes in your lifetime. They are so deep-seated in people’s mind that there’s nothing you can do to overcome them.
 A lot of times I’ve heard people who came to me saying “Oh, you are from Naples, so you must eat pizza everyday” or “I would like to live in Naples like you, because it never rains”.
 
 Sadly, stereotypes can be also related to bad things; therefore, they can have backwash on people’s opinions.
 
 So the only thing we can do to overcome stereotypes is explaining people what’s behind them.
 
 Tap on Run My Code to have an overview of Naples.
 Do you want to know what is behind these stereotypes? Tap on Mount Vesuvius and the sun, or - if you are hungry - tap on Pizzeria to see what is available. Meanwhile, enjoy listening to a famous Neapolitan song “Funiculì,Funiculà”.
 */


//#-hidden-code

import PlaygroundSupport
import UIKit
import AVFoundation

var player: AVAudioPlayer?

func playFuniculìFuniculà() {
    guard let url = Bundle.main.url(forResource: "Funiculì funculà", withExtension: "m4a") else { return }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: "m4a")
        
        guard let player = player else { return }
        
        player.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

playFuniculìFuniculà()

PlaygroundPage.current.liveView = NaplesViewController()
PlaygroundPage.current.needsIndefiniteExecution = true
//#-editable-code

//#-end-editable-code
//#-end-hidden-code

//: [Next](@next)


