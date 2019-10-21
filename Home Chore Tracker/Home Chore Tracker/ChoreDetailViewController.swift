//
//  ChoreDetailViewController.swift
//  Home Chore Tracker
//
//  Created by admin on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ChoreDetailViewController: UIViewController {
    
    
    @IBOutlet weak var completedChoreLabel: UILabel!
    @IBOutlet weak var choreImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var messageTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
        
        title = "Chore.name"
        
        completedChoreLabel.text = "Have you completed Chore.name"
        completedChoreLabel.textColor = UIColor(displayP3Red: 5.0, green: 85.0, blue: 150.0, alpha: 1.0)
        
        //choreImageView.image = Chore.image
        
        messageTextView.text = ""
        messageTextView.textColor = .white
        messageTextView.layer.backgroundColor = (UIColor(displayP3Red: 5.0, green: 175.0, blue: 80.0, alpha: 1.0) as! CGColor)
        
        doneButton.layer.cornerRadius = 4
        doneButton.layer.backgroundColor = (UIColor(displayP3Red: 5.0, green: 175.0, blue: 80.0, alpha: 1.0) as! CGColor)
        
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Chore Completed!", message: "Are you sure you have completed this chore?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
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
