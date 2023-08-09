//
//  ThirdViewController.swift
//  ObserverProject_iOS
//
//  Created by Sadia on 9/8/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        var name = nameTextField.text
        
        navigationController?.popViewController(animated: true)
    }
    

}
