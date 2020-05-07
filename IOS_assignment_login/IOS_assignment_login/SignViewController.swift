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
        self.navigationController?.navigationBar.topItem?.title = ""
        //탭 바 title 바꾸기
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1.0)
        //탭 바 color 바꾸기

        nameTextField.layer.cornerRadius = 22
        idTextField.layer.cornerRadius = 22
        pwTextField.layer.cornerRadius = 22
        SignUp.layer.cornerRadius = 24
        
        nameTextField.addLeftPadding()
        idTextField.addLeftPadding()
        pwTextField.addLeftPadding()
        
        //self.navigationController?.isNavigationBarHidden = false
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title:" ", style:.plain, target:nil, action: nil)
        

    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    
    @IBAction func SignUp(_ sender: Any) {
        //회원가입하기 버튼
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "scrollViewController") as? ScrollViewController else {return}
        /*
        receiveViewController.yourId = idTextField.text
        receiveViewController.yourPw = pwTextField.text
        */
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: true, completion: nil)
        
        idTextField.text=""
        pwTextField.text=""
    }
}
