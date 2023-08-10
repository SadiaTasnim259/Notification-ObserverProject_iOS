//
//  SecondViewController.swift
//  ObserverProject_iOS
//
//  Created by Sadia on 9/8/23.
//

import UIKit

var secondVCIsListening = false
class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listeningSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if secondVCIsListening {
            listeningSwitch.setOn(true, animated: false)
            switchToggled(listeningSwitch)
            setupObserver()
        }
        
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        
        if sender.isOn {
            view.backgroundColor = UIColor.systemMint
            nameLabel.text = "Listening"
            secondVCIsListening = true
            setupObserver()
        }else{
            view.backgroundColor = UIColor.systemCyan
            nameLabel.text = "Not Listening"
            secondVCIsListening = false
            clearObserver()
        }
    }
    
    func setupObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleNotification(_:)), name: .myNotificationName, object: nil)
    }
    
    @objc func handleNotification(_ sender:Notification){
        nameLabel.text = sender.userInfo? ["name"] as? String
        print("from SecondViewController")
    }
    
    func clearObserver(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
                
            self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
}
