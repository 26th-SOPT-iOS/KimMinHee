//
//  SecondViewController.swift
//  iOS_1st_Seminar
//
//  Created by 김민희 on 21/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLables()

    }
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    // 첫번째 화면에서 값을 받아오기 위해 선언
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLables(){
        guard let name = self.name else {return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        
        nameLabel.text = name
        emailLabel.text = email
        switchLabel.text = isOnOff ? "On" : "Off"
        frequencyLabel.text = "\(frequency)"
    }

    
    
}
