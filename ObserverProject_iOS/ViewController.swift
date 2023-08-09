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

    @IBAction func switchToggled(_ sender: UISwitch) {
        
        if sender.isOn{
            view.backgroundColor = UIColor.systemMint
            nameLabel.text = "Listening"
        }else{
            view.backgroundColor = UIColor.systemCyan
            nameLabel.text = "Not Listening"
        }
        
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                
            self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

