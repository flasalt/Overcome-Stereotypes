/*:
 ## **Discover Music**
 Finally, let’s get into Neapolitan music.
 
 The Neapolitan mandolin was made by “Casa Vinaccia”, specialized in the production of this instrument, in the middle of the 17th century.
 Its bowl-back shape was intended to increase its power and sound with a reduced volume of case and to ensure an optimal sound balance. The result is a very gentle stamp that, together with the reverb, fosters the tremolo effect.
 
 A very famous music, known all over the world, is the Neapolitan tarantella, a fast whirling Italian dance. If you want to listen to it, use the function playTarantella().
 */

//#-code-completion(everything, hide)
//#-code-completion(identifier, show, playTarantella())
//#-hidden-code
import UIKit
import PlaygroundSupport
import AVFoundation

class MandolinoViewController : UIViewController {
    
    //Variables and constants used for this ViewController
    let mandolin = UIImage(named: "mandolin.png")
    var mandolinImageView = UIImageView()
    let gradient = UIImage(named: "mandolinGradient.png")
    var gradientImageView = UIImageView()
    let note = UIImage(named: "note.png")
    var noteImageView = UIImageView()
    let secondNote = UIImage(named: "note.png")
    var secondNoteImageView = UIImageView()
    
    override func loadView() {
        //I create the view
        let view = UIView()
        //I show the view
        self.view = view
        
        //ImageView settings
        mandolinImageView.image = mandolin
        
        mandolinImageView.translatesAutoresizingMaskIntoConstraints = false
        mandolinImageView.contentMode = .scaleAspectFill
        
        mandolinImageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        gradientImageView.image = gradient
        gradientImageView.translatesAutoresizingMaskIntoConstraints = false
        gradientImageView.contentMode = .scaleAspectFill
        
        noteImageView.image = note
        noteImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        noteImageView.translatesAutoresizingMaskIntoConstraints = false
        noteImageView.contentMode = .scaleAspectFill
        noteImageView.frame = CGRect(x: 80, y: 150, width: self.noteImageView.frame.width, height: self.noteImageView.frame.height)
        noteImageView.alpha = 0
        
        secondNoteImageView.image = secondNote
        secondNoteImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        secondNoteImageView.translatesAutoresizingMaskIntoConstraints = false
        secondNoteImageView.contentMode = .scaleAspectFill
        secondNoteImageView.frame = CGRect(x: 80, y: 150, width: self.secondNoteImageView.frame.width, height: self.secondNoteImageView.frame.height)
        secondNoteImageView.alpha = 0
        
        let noteConstraintX = secondNoteImageView.trailingAnchor.constraint(equalTo: mandolinImageView.centerXAnchor, constant: -60)
        let noteConstraintY = secondNoteImageView.bottomAnchor.constraint(equalTo: mandolinImageView.topAnchor)
        
        let secondNoteConstraintX = secondNoteImageView.trailingAnchor.constraint(equalTo: mandolinImageView.centerXAnchor, constant: -80)
        let secondNoteConstraintY = secondNoteImageView.bottomAnchor.constraint(equalTo: mandolinImageView.topAnchor)
        
        //I add the views to the main one
        self.view.addSubview(gradientImageView)
        self.view.addSubview(mandolinImageView)
        self.view.addSubview(noteImageView)
        self.view.addSubview(secondNoteImageView)
        
        NSLayoutConstraint.activate([noteConstraintX, noteConstraintY])
        NSLayoutConstraint.activate([secondNoteConstraintX, secondNoteConstraintY])
        
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    override func viewDidAppear(_ animated: Bool) {
        mandolinImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        mandolinImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        gradientImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        gradientImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        gradientImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        gradientImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#-end-hidden-code
        //#-editable-code
        
        //#-end-editable-code
        //#-hidden-code
    }
    
    //What I needed to add music to this ViewController
    var player: AVAudioPlayer?
    
    func playTarantella() {
        guard let url = Bundle.main.url(forResource: "Tarantella", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        //notes animations
        noteImageView.alpha = 1
        secondNoteImageView.alpha = 1
        UIView.animate(withDuration: 7, animations: {
            
            self.noteImageView.frame = CGRect(x:Int(arc4random_uniform(UInt32(self.view.frame.width - self.noteImageView.frame.width - self.mandolinImageView.frame.width))),
                                              y:Int(arc4random_uniform(UInt32(self.view.frame.height - self.noteImageView.frame.height - self.mandolinImageView.frame.height))),
                                              width:Int(self.noteImageView.frame.width),
                                              height:Int(self.noteImageView.frame.height))
        }, completion: nil)
        
        UIView.animate(withDuration: 7, animations: {
            
            self.secondNoteImageView.frame = CGRect(x:Int(arc4random_uniform(UInt32(self.view.frame.width - self.secondNoteImageView.frame.width - self.mandolinImageView.frame.width))),
                                                    y:Int(arc4random_uniform(UInt32(self.view.frame.height - self.secondNoteImageView.frame.height - self.mandolinImageView.frame.height))),
                                                    width:Int(self.secondNoteImageView.frame.width),
                                                    height:Int(self.secondNoteImageView.frame.height))
        }, completion: nil)
    }
}

PlaygroundPage.current.liveView = MandolinoViewController()

//#-end-hidden-code

