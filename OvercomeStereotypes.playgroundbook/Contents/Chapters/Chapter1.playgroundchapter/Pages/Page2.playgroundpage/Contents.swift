/*:
 ## **Pulcinella**
 Pulcinella (in Neapolitan “Pullecenella”) is the most ancient and famous stock character created in Naples.
 He is lazy, funny, chatty and willing to do anything to eat a plate of spaghetti - his true love.
 
 **Challenge:** Use the function showPulcinella() to see the character. Then, use the function cookSpaghetti() to see how Pulcinella’s behavior changes. Lastly, if you want to smell the genuine ingredients of the Neapolitan cuisine, use the function smellSpaghetti()... sorry, I’m joking. This won’t happen. Anyway, if you want to try to imagine it, use this function with your eyes closed. Otherwise you just have to visit Naples to taste it :)
 
 Tap on Run My Code to show the changes you make.
 
 **Learning tip:** the function smellSpaghetti() is empty. This means that if you want something to happen, you need to insert some code in the function.
 
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, showPulcinella(), cookSpaghetti(), smellSpaghetti())
//#-hidden-code
import Foundation
import UIKit
import PlaygroundSupport

class PulcinellaViewController: UIViewController {
    
    //Variables and constants used for this ViewController
    let grass = UIImage(named: "green.png")
    var grassImageView = UIImageView()
    
    let sky = UIImage(named: "sky.png")
    var skyImageView = UIImageView()
    
    let pulcinellaFirstCharacter = UIImage(named: "firstPulcinella.png")
    var pulcinellaFirstCharacterImageView = UIImageView()
    
    var sunImageView = UIImageView()
    
    let spaghetti = UIImage(named: "spaghetti.png")
    var spaghettiImageView: UIImageView!
    
    let pulcinellaSecondCharacter = UIImage(named: "secondPulcinella.png")
    
    let smoke = UIImage(named: "smoke.png")
    var smokeImageView = UIImageView()
    
    let mountVesuviusImageView = UIImageView()
    let mountVesuvius = UIImage(named: "realVesuvio2.png")
    
    override func loadView() {
        //I create the view
        let view = UIView()
        //I show the view
        self.view = view
        
        //Sun settings
        let sunRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        sunImageView.frame = sunRect
        
        //PulcinellaFirstCharacter settings
        let pulcinellaFirstCharacterRect = CGRect(x: 0, y: 0, width: 200, height: 250)
        pulcinellaFirstCharacterImageView.frame = pulcinellaFirstCharacterRect
        pulcinellaFirstCharacterImageView.alpha = 0
        
        //I associate an image to its ImageView
        skyImageView.image = sky
        grassImageView.image = grass
        
        sunImageView.image = UIImage(named:"sun.png")
        
        pulcinellaFirstCharacterImageView.image = pulcinellaFirstCharacter
        
        smokeImageView.image = smoke
        
        spaghettiImageView = UIImageView(image: spaghetti)
        spaghettiImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width / 8  , height: self.view.frame.height / 8)
        spaghettiImageView.alpha = 0
        smokeImageView.alpha = 0
        
        //I prepare the ImageView for the constraints and I scale them
        smokeImageView.translatesAutoresizingMaskIntoConstraints = false
        smokeImageView.contentMode = .scaleToFill
        
        grassImageView.translatesAutoresizingMaskIntoConstraints = false
        grassImageView.contentMode = .scaleToFill
        
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        
        pulcinellaFirstCharacterImageView.translatesAutoresizingMaskIntoConstraints = false
        pulcinellaFirstCharacterImageView.contentMode = .scaleAspectFit
        pulcinellaFirstCharacterImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        
        spaghettiImageView.translatesAutoresizingMaskIntoConstraints = false
        spaghettiImageView.contentMode = .scaleAspectFill
        
        skyImageView.translatesAutoresizingMaskIntoConstraints = false
        skyImageView.contentMode = .scaleAspectFill
        
        spaghettiImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        smokeImageView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        
        mountVesuviusImageView.image = mountVesuvius
        mountVesuviusImageView.translatesAutoresizingMaskIntoConstraints = false
        mountVesuviusImageView.contentMode = .scaleAspectFill
        
        //Here I add all the views to the main one
        self.view.addSubview(skyImageView)
        self.view.addSubview(grassImageView)
        self.view.addSubview(sunImageView)
        self.view.addSubview(mountVesuviusImageView)
        self.view.addSubview(pulcinellaFirstCharacterImageView)
        self.view.addSubview(spaghettiImageView)
        self.view.addSubview(smokeImageView)
        
        
        
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    override func viewDidAppear(_ animated: Bool) {
        skyImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        skyImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        skyImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        grassImageView.topAnchor.constraint(equalTo: skyImageView.bottomAnchor).isActive = true
        grassImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        grassImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        grassImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        grassImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        grassImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        sunImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        sunImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        //        sunImageView.heightAnchor.constraint(equalTo: view.bounds.height < view.bounds.width ? view.heightAnchor : view.widthAnchor, multiplier: 0.2).isActive = true
        sunImageView.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 8).isActive = true
        sunImageView.widthAnchor.constraint(equalTo: sunImageView.heightAnchor).isActive = true
        
        spaghettiImageView.trailingAnchor.constraint(equalTo: self.pulcinellaFirstCharacterImageView.trailingAnchor, constant: 90).isActive = true
        
        pulcinellaFirstCharacterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pulcinellaFirstCharacterImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 70).isActive = true
        
        pulcinellaFirstCharacterImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 20).isActive = true
        //        pulcinellaFirstCharacterImageView.topAnchor.constraint(equalTo: self.grassImageView.topAnchor).isActive = true
        
        spaghettiImageView.bottomAnchor.constraint(equalTo: grassImageView.topAnchor , constant: 70).isActive = true
        
        smokeImageView.bottomAnchor.constraint(equalTo: self.spaghettiImageView.topAnchor, constant: 98).isActive = true
        
        smokeImageView.trailingAnchor.constraint(equalTo: self.spaghettiImageView.trailingAnchor, constant: -65).isActive = true
        
        mountVesuviusImageView.bottomAnchor.constraint(equalTo: self.grassImageView.topAnchor).isActive = true
        mountVesuviusImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mountVesuviusImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mountVesuviusImageView.heightAnchor.constraint(equalTo: self.mountVesuviusImageView.widthAnchor, multiplier: 349/1368).isActive = true
    }
    
    override func viewDidLoad() {
        //#-end-hidden-code
        //#-editable-code

        //#-end-editable-code
        //#-hidden-code
    }
    
    //Functions for this ViewController
    func cookSpaghetti() {
        spaghettiImageView.alpha = 1
        pulcinellaFirstCharacterImageView.image = pulcinellaSecondCharacter
        UIImageView.animate(withDuration: 3.5, delay: 0.0, options: [.repeat , .autoreverse] , animations: {
            UIViewAnimationOptions.curveEaseIn
            self.smokeImageView.alpha = 0.5
        }, completion: nil)
    }
    func showPulcinella() {
        pulcinellaFirstCharacterImageView.alpha = 1
    }
    func smellSpaghetti() {
    }
}

//extension used to create the background color
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
}
public let background = UIColor(red: 139, green: 205, blue: 255)



PlaygroundPage.current.needsIndefiniteExecution = true
let pulcinellaVC = PulcinellaViewController()
PlaygroundPage.current.liveView = pulcinellaVC

PlaygroundPage.current.assessmentStatus = .fail(hints: ["You won’t see how Pulcinella’s behavior changes unless you show him first."], solution: nil)

//#-end-hidden-code

//: [Next](@next)
