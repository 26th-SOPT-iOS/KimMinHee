//
//  LoginViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 18/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLables()

        // Do any additional setup after loading the view.
    }
    var yourId: String?
    var yourPw: String?

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func Logout(_ sender: Any) {
        //로그아웃 버튼
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setLables() {
        guard let yourId = self.yourId else{return}
        guard let yourPw = self.yourPw else{return}
        
        idTextField.text = yourId
        pwTextField.text = yourPw
        
        }
    
}
