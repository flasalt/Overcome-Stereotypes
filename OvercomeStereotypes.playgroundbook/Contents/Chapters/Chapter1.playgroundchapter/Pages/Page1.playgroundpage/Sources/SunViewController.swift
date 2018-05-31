//
//  SunViewController.swift
//  
//
//  Created by Flavia  Saltelli on 25/03/18.
//

import Foundation
import UIKit
import PlaygroundSupport

public class SunViewController : UIViewController {
    
    //Variables and constants used for this ViewController
    public var sunImageView = UIImageView()
    public let backButton = UIButton()
    public let sunText = UITextView()
    public let sunTextTwo = UITextView()
    
    override public func viewDidLoad() {
        //I create my view
        let sunView = UIView()
        //I set a backgorund color for my view
        sunView.backgroundColor = background
        
        //TextView settings
        self.sunText.text = "\"O’ sole, o’ mare, o’ core.\" \n(the sun, the sea, the heart)"
        sunText.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        sunText.font = UIFont.italicSystemFont(ofSize: 26)
        sunText.textColor = UIColor.white
        sunText.backgroundColor = UIColor.clear
        sunText.textAlignment = .center
        sunText.alpha = 1
        sunText.isEditable = false
        sunText.isSelectable = false
        sunText.isScrollEnabled = false
        
        self.sunTextTwo.text = "Naples is renowned for being the city where the sun always shines. For this reason, it is said that Neapolitan people are very cheerful and expansive."
        sunTextTwo.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        sunTextTwo.font = UIFont.systemFont(ofSize: 24)
        sunTextTwo.textColor = UIColor.white
        sunTextTwo.backgroundColor = UIColor.clear
        sunTextTwo.textAlignment = .natural
        sunTextTwo.alpha = 1
        sunTextTwo.isEditable = false
        sunTextTwo.isSelectable = false
        sunTextTwo.isScrollEnabled = false
        
        //Button settings
        backButton.frame = CGRect(x: 0, y: 0, width: 100 , height: 40 )
        backButton.layer.cornerRadius = backButton.frame.size.height / 2
        backButton.clipsToBounds = true
        backButton.backgroundColor = UIColor.blue
        backButton.setTitle("Back", for: .normal)
        //I set the the action for the button
        backButton.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        
        //Sun image view settings
        let sunRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        sunImageView.frame = sunRect
        sunImageView.image = UIImage(named:"sun.png")
        sunImageView.contentMode = .scaleAspectFill
        
        //I prepare the elements of the view for the constraints
        sunImageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        sunText.translatesAutoresizingMaskIntoConstraints = false
        sunTextTwo.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = sunView
        sunView.addSubview(backButton)
        sunView.addSubview(sunImageView)
        sunView.addSubview(sunText)
        sunView.addSubview(sunTextTwo)
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    
    public override func viewDidAppear(_ animated: Bool) {
        
        sunImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sunImageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 100).isActive = true
        sunImageView.widthAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
        sunImageView.heightAnchor.constraint(equalTo: self.sunImageView.widthAnchor).isActive = true
        
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sunText.topAnchor.constraint(equalTo: self.sunImageView.bottomAnchor, constant: 20).isActive = true
        sunText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sunText.widthAnchor.constraint(equalToConstant: 350).isActive = true
        sunText.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        sunTextTwo.widthAnchor.constraint(equalToConstant: 300).isActive = true
        sunTextTwo.bottomAnchor.constraint(lessThanOrEqualTo: self.backButton.topAnchor).isActive = true
        sunTextTwo.topAnchor.constraint(equalTo: self.sunText.bottomAnchor, constant: 20).isActive = true
        sunTextTwo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 8).isActive = true
        
    }
    //Here I declare where the function should bring.
    @objc func backToMain() {
        PlaygroundPage.current.liveView = NaplesViewController()
    }
    
}


