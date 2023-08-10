//
//  ViewController.swift
//  ObserverProject_iOS
//
//  Created by Sadia on 9/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        clearObserver()
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        
        if sender.isOn{
            view.backgroundColor = UIColor.systemMint
            nameLabel.text = "Listening"
            setupObserver()
        }else{
            view.backgroundColor = UIColor.systemCyan
            nameLabel.text = "Not Listening"
            clearObserver()
        }
    }
    
    func setupObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .myNotificationName, object: nil)
    }
    
    @objc func handleNotification(_ sender:Notification){
        nameLabel.text = sender.userInfo?["name"] as? String
        print("from ViewController")
    }
    
    func clearObserver(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                
            self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

