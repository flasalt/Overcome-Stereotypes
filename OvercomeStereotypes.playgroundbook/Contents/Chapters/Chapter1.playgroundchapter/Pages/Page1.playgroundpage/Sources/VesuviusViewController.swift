import UIKit
import Foundation
import PlaygroundSupport

public class VesuviusViewController: UIViewController {
    
    //Variables and constants used for this ViewController
    var vesuviusImageView = UIImageView()
    let backButton = UIButton()
    let vesuviusText = UITextView()
    
    
    override public func loadView() {
        //Here I create the view and set a background color for it
        let vesuviusView = UIView()
        vesuviusView.backgroundColor = background
        
        //Text view settings
        self.vesuviusText.text = "Mount Vesuvius is part of the collective imagination of the city of Naples.\nAccording to mythology, the volcano was related to Hercules who found a place called “the Phlegraean Plain” (“plain of fire”) walking around here. It was inhabited by giant bandits called “the sons of the Earth”, later beaten by the hero with the assistance of the gods. For this reason, Mount Vesuvius was regarded by the Romans as devoted to Hercules, who brought about peace to the place again. \nThere’s more: the first funicular cable on Mount Vesuvius opened in 1880 and gave name to the song “Funiculì,Funiculà”."
        vesuviusText.font = UIFont.systemFont(ofSize: 24)
        vesuviusText.textColor = UIColor.white
        vesuviusText.backgroundColor = UIColor.clear
        vesuviusText.textAlignment = .natural
        vesuviusText.alpha = 1
        vesuviusText.isEditable = false
        vesuviusText.isSelectable = false
        
        //I associate the image of the Vesuvius to vesuviusImageView
        vesuviusImageView.image = UIImage(named:"realVesuvio1.png")
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        //I sclae the imageView and prepare it for the constraints
        vesuviusImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        vesuviusImageView.translatesAutoresizingMaskIntoConstraints = false
        vesuviusImageView.contentMode = .scaleAspectFill
        
        //Button settings
        backButton.frame = CGRect(x: 0, y: 0, width: 100 , height: 40)
        backButton.layer.cornerRadius = backButton.frame.size.height / 2
        backButton.clipsToBounds = true
        backButton.backgroundColor = UIColor.blue
        backButton.setTitle("Back", for: .normal)
        
        backButton.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        vesuviusText.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view = vesuviusView
        vesuviusView.addSubview(vesuviusImageView)
        vesuviusView.addSubview(backButton)
        vesuviusView.addSubview(vesuviusText)
        
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    public override func viewDidAppear(_ animated: Bool) {
        
        vesuviusImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vesuviusImageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 100).isActive = true
        vesuviusImageView.widthAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
        vesuviusImageView.heightAnchor.constraint(equalTo: self.vesuviusImageView.widthAnchor).isActive = true
        
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        vesuviusText.topAnchor.constraint(equalTo: self.vesuviusImageView.bottomAnchor, constant: 15).isActive = true
        vesuviusText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        vesuviusText.widthAnchor.constraint(equalToConstant: 350).isActive = true
        //vesuviusText.heightAnchor.constraint(equalToConstant: ).isActive = true
        //vesuviusText.bottomAnchor.constraint(lessThanOrEqualTo: self.backButton.topAnchor, constant: -20).isActive = true
        vesuviusText.bottomAnchor.constraint(equalTo: self.backButton.topAnchor, constant: -15).isActive = true
        
    }
    //Here I declare where the function should bring.
    @objc func backToMain() {
        PlaygroundPage.current.liveView = NaplesViewController()
    }
}



