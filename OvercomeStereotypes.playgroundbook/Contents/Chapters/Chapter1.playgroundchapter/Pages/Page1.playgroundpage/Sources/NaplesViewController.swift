import Foundation
import UIKit
import PlaygroundSupport

public class NaplesViewController : UIViewController {
    
    //Variables and constants used for this ViewController
    
    public let sky = UIImage(named: "sky.png")
    public var skyImageView = UIImageView()
    public let sea = UIImage(named: "sea.png")
    public var seaImageView = UIImageView()
    public let sunButton = UIButton()
    public let sun = UIImage(named: "sun.png")
    public let mountVesuviusButton = UIButton()
    public let mountVesuvius = UIImage(named: "realVesuvio2.png")
    public let ground = UIImage(named: "ground.png")
    public var groundImageView = UIImageView()
    public let pizzeria = UIImage(named: "pizzeria.png")
    public var pizzeriaButton = UIButton()
    
    override public func loadView() {
        //Here I create the view
        let view = UIView()
        //I show the view
        self.view = view
        
        //I associate the image of the sea to seaImageView
        seaImageView.image = sea
        
        //I create a frame for the sun button and I associate the image to it
        let sunRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        sunButton.frame = sunRect
        sunButton.setImage(sun, for: .normal)
        //I prepare the image for the constraints
        sunButton.translatesAutoresizingMaskIntoConstraints = false
        
        //I associate the image of the ground to groundImageView
        groundImageView.image = ground
        //I give the imageView its content mode and I prepare the image for the constraints
        groundImageView.translatesAutoresizingMaskIntoConstraints = false
        groundImageView.contentMode = .scaleToFill
        
        //I associate the image of the sky to skyImageView
        skyImageView.image = sky
        //I give the imageView its content mode and I prepare the image for the constraints
        skyImageView.translatesAutoresizingMaskIntoConstraints = false
        skyImageView.contentMode = .scaleAspectFill
        
        //I set the image, the content mode for mount Vesuvius button. Then, I prepare the image for the constraints
        mountVesuviusButton.setImage(mountVesuvius, for: .normal)
        mountVesuviusButton.translatesAutoresizingMaskIntoConstraints = false
        mountVesuviusButton.contentMode = .scaleAspectFill
        
        //I give the imageView its content mode and I prepare the image for the constraints
        seaImageView.translatesAutoresizingMaskIntoConstraints = false
        seaImageView.contentMode = .scaleToFill
        
        //I set the image,the content mode, the action for the pizzeria button. Then, I prepare the image for the constraints
        pizzeriaButton.setImage(pizzeria, for: .normal)
        pizzeriaButton.addTarget(self, action: #selector(goToPizzeriaPage), for: .touchUpInside)
        pizzeriaButton.translatesAutoresizingMaskIntoConstraints = false
        pizzeriaButton.contentMode = .scaleAspectFit
        
        //I set the action for the sun button.
        sunButton.addTarget(self, action: #selector(goToSunPage), for: .touchUpInside)
        //I set the action for the mount vesuvius button.
        mountVesuviusButton.addTarget(self, action: #selector(goToVesuviusPage), for: .touchUpInside)
        
        //Here I add all the views to the main one
        self.view.addSubview(skyImageView)
        self.view.addSubview(seaImageView)
        self.view.addSubview(sunButton)
        self.view.addSubview(groundImageView)
        self.view.addSubview(mountVesuviusButton)
        self.view.addSubview(pizzeriaButton)
    }
    //Here I declare where the functions should bring.
    @objc public func goToSunPage(sender: UIButton!) {
        PlaygroundPage.current.liveView = SunViewController()
    }
    @objc public func goToVesuviusPage(sender: UIButton!) {
        PlaygroundPage.current.liveView = VesuviusViewController()
    }
    @objc public func goToPizzeriaPage(sender: UIButton!) {
        PlaygroundPage.current.liveView = PizzeriaViewController()
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    public override func viewDidAppear(_ animated: Bool) {
        skyImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        skyImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        skyImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        groundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        groundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        groundImageView.heightAnchor.constraint(equalTo: self.seaImageView.heightAnchor).isActive = true
        groundImageView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2).isActive = true
        
        seaImageView.topAnchor.constraint(equalTo: skyImageView.bottomAnchor).isActive = true
        seaImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        seaImageView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 3).isActive = true
        seaImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        seaImageView.leadingAnchor.constraint(equalTo: self.groundImageView.trailingAnchor).isActive = true
        
        sunButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        sunButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        sunButton.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 6).isActive = true
        sunButton.widthAnchor.constraint(equalTo: sunButton.heightAnchor).isActive = true
        
        mountVesuviusButton.bottomAnchor.constraint(equalTo: self.seaImageView.topAnchor).isActive = true
        mountVesuviusButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mountVesuviusButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mountVesuviusButton.heightAnchor.constraint(equalTo: self.mountVesuviusButton.widthAnchor, multiplier: 349/1368).isActive = true
        
        pizzeriaButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -7).isActive = true
        pizzeriaButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        //pizzeriaButton.heightAnchor.constraint(equalToConstant: self.groundImageView.frame.height / 2).isActive = true
        //pizzeriaButton.widthAnchor.constraint(equalToConstant: self.view.frame.width / 2.5 ).isActive = true
        pizzeriaButton.heightAnchor.constraint(equalToConstant: 180).isActive = true
        pizzeriaButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}



//I create an extension of type UIColor to use the specific color I need
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
}
public let background = UIColor(red: 139, green: 205, blue: 255)


