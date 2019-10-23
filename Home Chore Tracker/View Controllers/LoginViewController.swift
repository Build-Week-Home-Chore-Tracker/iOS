//
//  LoginViewController.swift
//  Home Chore Tracker
//
//  Created by admin on 10/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var choreLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let orange = UIColor(displayP3Red: 220.0, green: 150.0, blue: 10.0, alpha: 1.0)
    let blue = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
    let green = UIColor(displayP3Red: 5.0, green: 175.0, blue: 80.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        
        choreLabel.backgroundColor = green
        choreLabel.layer.backgroundColor = green as! CGColor
        choreLabel.layer.cornerRadius = 4
        choreLabel.textColor = .white
        
        userNameLabel.textColor = orange
        
        passwordLabel.textColor = orange
        
        loginButton.layer.backgroundColor = green as! CGColor
        loginButton.layer.cornerRadius = 4
        
        
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
