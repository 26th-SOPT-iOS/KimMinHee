//
//  MainViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 18/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBAction func login(_ sender: Any) {

        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in switch networkResult {
        case .success(let token):
            guard let token = token as? String else { return }
            UserDefaults.standard.set(token, forKey: "token")
            guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                UITabBarController else { return }
            tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
        case .requestErr(let message):
            guard let message = message as? String else { return }
            let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertViewController.addAction(action)
            self.present(alertViewController, animated: true, completion: nil)
        case .pathErr: print("path")
        case .serverErr: print("serverErr")
        case .networkFail: print("networkFail") }
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        // navigation tap 투명하게

        idTextField.layer.cornerRadius = 22
        pwTextField.layer.cornerRadius = 22
        loginButton.layer.cornerRadius = 24

        idTextField.addLeftPadding()
        pwTextField.addLeftPadding()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBAction func GoLogin(_ sender: Any) {
        // 로그인 버튼
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
    
    @IBOutlet weak var SignText: UILabel!
    
    @IBAction func SignViewMove(_ sender: Any) {
        // 회원가입 버튼
        guard let SignPush = self.storyboard?.instantiateViewController(identifier: "signViewController") as? SignViewController else {return}
        
        self.navigationController?.pushViewController(SignPush, animated: true)
        
    }
    
}
extension UITextField {
    func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
}
