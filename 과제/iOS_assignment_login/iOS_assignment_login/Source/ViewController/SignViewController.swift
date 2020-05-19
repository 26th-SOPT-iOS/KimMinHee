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
        emailTextField.layer.cornerRadius = 22
        pwTextField.layer.cornerRadius = 22
        idTextField.layer.cornerRadius = 22
        phoneTextField.layer.cornerRadius = 22
        SignUp.layer.cornerRadius = 24
        
        idTextField.addLeftPadding()
        nameTextField.addLeftPadding()
        emailTextField.addLeftPadding()
        pwTextField.addLeftPadding()
        phoneTextField.addLeftPadding()
        
        //self.navigationController?.isNavigationBarHidden = false
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title:" ", style:.plain, target:nil, action: nil)
        

    }
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var SignUp: UIButton!
    
    @IBAction func SignUp(_ sender: Any) {
        //회원가입하기 버튼
        guard let inputID = idTextField.text else { return }
               guard let inputPWD = pwTextField.text else { return }
               guard let inputNAME = nameTextField.text else { return }
               guard let inputEMAIL = emailTextField.text else { return }
               guard let inputPHONE = phoneTextField.text else { return }
               
               SignUpService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
                   switch networkResult {
               case .success(let token):
                   guard let token = token as? String else {return}
                   UserDefaults.standard.set(token, forKey: "token")
                   
                   //self.navigationController?.popViewController(animated: bool)
                   LoginService.shared.login(id: inputID, pwd: inputPWD) {_ in
                           guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                               UITabBarController else { return }
                           tabbarController.modalPresentationStyle = .fullScreen
                           
                       self.present(tabbarController, animated: true, completion: nil)
                       
                       }
                       
               case .requestErr(let message):
                   guard let message = message as? String else { return }
                   let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                   let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                   alertViewController.addAction(action)
                   self.present(alertViewController, animated: true, completion: nil)
                       
               case .pathErr: print("path")
                       
               case .serverErr: print("serverErr")
                       
               case .networkFail: print("networkFail") }
               }
               //회원가입하기 버튼
               /*
               guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "scrollViewController") as? ScrollViewController else {return}
               /*
               receiveViewController.yourId = idTextField.text
               receiveViewController.yourPw = pwTextField.text
               */
               receiveViewController.modalPresentationStyle = .fullScreen
               self.present(receiveViewController, animated: true, completion: nil)
               
               idTextField.text=""
               pwTextField.text=""
        */
    }
}
