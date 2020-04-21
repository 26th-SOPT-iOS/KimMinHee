//
//  SignViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 18/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var idTextField: UITextField!
    

    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func SignUp(_ sender: Any) {
        //회원가입하기 버튼
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}
        
        receiveViewController.yourId = idTextField.text
        receiveViewController.yourPw = pwTextField.text
        self.present(receiveViewController, animated: true, completion: nil)
        idTextField.text=""
        pwTextField.text=""
    }
}
