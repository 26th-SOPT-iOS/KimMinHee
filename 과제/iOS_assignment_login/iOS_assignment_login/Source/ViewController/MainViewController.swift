//
//  MainViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 18/04/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import BEMCheckBox

class MainViewController: UIViewController {
    let checkbox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(48), y: CGFloat(395), width: CGFloat(15), height: CGFloat(15)))
    
    @IBAction func login(_ sender: Any) {

        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in switch networkResult {
        case .success(let token):
            if self.checkbox.on == true { // 자동로그인이 선택되어 있으면 id,pwd를 공유객체에 저장함
                UserDefaults.standard.set(self.idTextField.text, forKey: "autoid")
                UserDefaults.standard.set(self.pwTextField.text, forKey: "autopw")
               }
            guard let token = token as? String else { return }
            UserDefaults.standard.set(token, forKey: "token")
            print("myToken:",token)
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
        
       // UserDefaults.standard.removeObject(forKey: "to")
        //UserDefaults.standard.removeObject(forKey: "too")
        //UserDefaults.standard.removeObject(forKey: "token")

        if UserDefaults.standard.string(forKey: "autoid") != nil{
            print(UserDefaults.standard.string(forKey: "autoid"))
            guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                    UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
            self.present(tabbarController, animated: true, completion: nil)
            
        }
        super.viewDidLoad()
        self.view.addSubview(checkbox)
        if (UserDefaults.standard.string(forKey: "id") != nil){
        guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                UITabBarController else { return }
            tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
          }
        
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
        self.checkbox.onTintColor = UIColor.blue

    }
    override func viewWillAppear(_ animated: Bool) {
        self.login(setLables()) // login 버튼에 setLabels에서 받아온 값들을 넣어서 버튼이 자동으로 눌리게함
    }
    var yourId: String?
    var yourPw: String?
    
    func setLables() {
        
    guard let yourId = self.yourId else{return} //id값 전달 받아오기
    guard let yourPw = self.yourPw else{return} //pw 값 전달 받아오기
    
    idTextField.text = yourId
    pwTextField.text = yourPw
        // 받아온 값들 field에 각각 넣어줌
    
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
