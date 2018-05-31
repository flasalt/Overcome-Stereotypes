import UIKit
import PlaygroundSupport

public class PizzeriaViewController : UIViewController {
    
    //Variables and constants used for this ViewController
    
    let backButton = UIButton()
    let pizza = UIImage(named: "pizza.png")
    var pizzaImageView = UIImageView()
    let pizzaText = UITextView()
    
    override public func loadView() {
        
        //Here I create the view
        let pizzeriaView = UIView()
        //I set a background color to my view
        pizzeriaView.backgroundColor = background
        
        //Here I set the frame, the corner radius, the color and the title for the back button
        backButton.frame = CGRect(x: 0, y: 0, width: 100 , height: 40 )
        backButton.layer.cornerRadius = backButton.frame.size.height / 2
        backButton.clipsToBounds = true
        backButton.backgroundColor = UIColor.blue
        backButton.setTitle("Back", for: .normal)
        
        //I set the action for the sun button and I prepare it for the constraints
        backButton.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        //TextView settings
        self.pizzaText.text = "Back in 1889, in order to honor Queen of Italy, Margherita of Savoy, chef Raffaele Esposito cooked the so-called pizza Margherita , made with tomatoes, mozzarella and basil, which represent Italian flag colours 🇮🇹 ."
        pizzaText.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        pizzaText.font = UIFont.systemFont(ofSize: 24)
        pizzaText.textColor = UIColor.white
        pizzaText.backgroundColor = UIColor.clear
        pizzaText.textAlignment = .natural
        pizzaText.alpha = 1
        pizzaText.isEditable = false
        pizzaText.isSelectable = false
        pizzaText.isScrollEnabled = false
        //I set the image for the imageView
        pizzaImageView.image = pizza
        
        //I prepare elements for constraints
        pizzaText.translatesAutoresizingMaskIntoConstraints = false
        pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //I add elements on the view
        self.view = pizzeriaView
        pizzeriaView.addSubview(backButton)
        pizzeriaView.addSubview(pizzaImageView)
        pizzeriaView.addSubview(pizzaText)
    }
    
    //In viewDidAppear I set the constraints for each element that will be displayed.
    override public func viewDidAppear(_ animated: Bool) {
        
        pizzaImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pizzaImageView.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 100).isActive = true
        pizzaImageView.widthAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
        pizzaImageView.heightAnchor.constraint(equalTo: self.pizzaImageView.widthAnchor).isActive = true
        
        backButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
        backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pizzaText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        pizzaText.bottomAnchor.constraint(lessThanOrEqualTo: self.backButton.topAnchor).isActive = true
        pizzaText.topAnchor.constraint(equalTo: self.pizzaImageView.bottomAnchor, constant: 20).isActive = true
        pizzaText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 8).isActive = true
        
    }
    
    //Here I declare where the functions should bring.
    @objc func backToMain() {
        PlaygroundPage.current.liveView = NaplesViewController()
    }
    
    
}

