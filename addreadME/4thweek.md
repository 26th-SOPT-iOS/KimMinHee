## 🧸 Network 통신 - 회원가입 API 요청하기 🧸

> ### API

* 회원가입 JSON Data

```swift
status = (try? values.decode(Int.self, forKey: .status)) ?? -1
success = (try? values.decode(Bool.self, forKey: .success)) ?? false
message = (try? values.decode(String.self, forKey: .message)) ?? ""
```
JSONDecoder를 사용할 때 error 검출을 위해 try를 사용한다.<br>
만약 값이 있다면 **try?** 뒤의 값을 반환하고 만약 값이 없다면 **??** 뒤의 값을 반환한다.

* 회원가입 서버 통신 구현<br>
Q. *싱글톤 객체* 란?<br>
A. 객체를 하나만 생성해서 여러 곳에서 접근해 사용하고 싶을 때 사용하는 방법으로,<br>
한번의 객체 생성만 이뤄지기 때문에 메모리 낭비를 방지할 수 있다.

<img width="435" alt="signin parameter" src="https://user-images.githubusercontent.com/51286963/82601604-c819ad80-9bea-11ea-8fb5-e25ff2299b5c.png">

```swift
private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters { return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
```
로그인 요청과 달리 회원가입의 RequestBody에는 5개의 Parameter가 들어가는 것을<br>
postman 요청을 통해 확인 한 후 5개의 값을 넣어주었다.
<br>
> ### 회원가입 후 자동 로그인

![회원가입_자동로그인](./사진/회원가입_자동로그인.gif)
- 회원가입 시 요구하는 정보를 모두 넣어준 후 회원가입 button을 누르면 <br>
로그인 페이지로 돌아감과 동시에 id와 pw가 채워진 채 자동 로그인이 되어야한다.

```swift
SignUpService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
    }
```
앞에서 정의해 둔 **싱글톤 객체** 를 통해 데이터 통신을 진행했다.

- 회원가입 성공시

```swift
case .success:
    guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "mainviewcontroller") as? MainViewController else { return }
        receiveViewController.yourId = inputID
        receiveViewController.yourPw = inputPWD
        self.navigationController?.show(receiveViewController, sender: self)
    }
```
[1주차_값 전달하기](./1stweek.md)에서 배웠던 것을 이용해 id,pw 값을 넘겨 준 후 다시 로그인 view로 이동하고

```swift
override func viewWillAppear(_ animated: Bool) {
        self.login(setLables())
        }
```
로그인 view 에서는 **viewWillAppear** 즉, view가 안보였다가 다시 보이게 되었을 때 작동하는 함수를 이용해<br>
login 버튼에 받아온 id와 pw를 넣어서 버튼을 클릭한 효과를 줬다.

```swift
        case .success(let token):
            guard let token = token as? String else { return }
            UserDefaults.standard.set(token, forKey: "token")
            guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                UITabBarController else { return }
            tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
```
로그인 요청을 보내 token을 이용하여 자동 로그인 기능을 구현하였다.

- 회원가입 실패시

회원가입이 실패하는 경우에는 4가지 case가 존재한다.

    1. requestErr : 요청에러
    2. pathErr : 경로에러
    3. serverErr : 서버 내부 에러
    4. networkFail : 네트워크 연결 실패 에러 

<img width="248" alt="실패 alter" src="https://user-images.githubusercontent.com/51286963/82604185-dd90d680-9bee-11ea-9ee6-410c32f5d84a.png">

```swift
 case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
```
이 중 회원가입에서의 요청 error는 이미 존재하는 id를 사용했을 때 error가 발생하기 때문에 message와 함께 alter을 띄어준다.

<br>

> ### CheckBox를 이용한 자동로그인

자동로그인Off - 로그인           |  자동로그인On - 로그인
:-------------------------:|:-------------------------:
![자동로그인Off](./사진/자동로그인Off.gif) |  ![자동로그인On](./사진/자동로그인On.gif)

- BEMCheckBox(Cocoapod) 활용한 CheckBox 만들기

```
pod 'BEMCheckBox'
```
먼저 Alamofire와 Kingfisher를 설치해 둔 Podfile에 BEMCheckBox 코코아팟을 추가 설치해준다.

```swift
import BEMCheckBox

let checkbox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(48), y: CGFloat(395), width: CGFloat(15), height: CGFloat(15)))

override func viewDidLoad() {
        self.view.addSubview(checkbox) 
        }
```
설치한 BEMCheckBox를 import 해주고 자리를 정해주면 화면에 띄어지게된다.

Check Off             |  Check On
:-------------------------:|:-------------------------:
<img alt="자동로그인off" src="https://user-images.githubusercontent.com/51286963/82660309-19668300-9c65-11ea-9e61-ceeb782bdeef.png" >  |  <img alt="자동로그인on" src="https://user-images.githubusercontent.com/51286963/82660322-1ec3cd80-9c65-11ea-8d77-56a021a1bdd4.png">


- BEMCheckBox(Cocoapod) 활용한 자동로그인 구현

```swift
case .success(let token):
            if self.checkbox.on == true { 
                UserDefaults.standard.set(self.idTextField.text, forKey: "autoid")
                UserDefaults.standard.set(self.pwTextField.text, forKey: "autopw")
                }
```
만약 자동로그인이 on 되어 있다면 (= 클릭 되었다면) id와 pw 값을 UserDefaults의 공유 객체에 저장해준다.
> 
Q. UserDefaults는 어떨때 사용할 수 있는걸까요?<br>
A. UserDefaults는 앱의 어느곳에서나 데이터를 저장하고 읽게 도와주는 임시 저장소의 역할을 합니다.<br>
key값과 value값을 저장한 후, 원할 때 key 값을 호출해 값을 불러올 수 있다. <br>
이런 쓰임새로 이번 자동 로그인과제에서도 사용해보았습니다~

=> 자동 로그인이 클릭되어있다면, **즉, 내가 정해둔 공유 객체에 값이 저장되어 있다면** 앱을 종료했다가 다시 실행했을때 <br>
Login 화면이 아닌 홈 화면이 뜨게 설정해줘야한다. 여기서 로그인 화면을 거쳐서 가는게 아닌 바로 홈 화면을 띄우기위해 어떻게 해줘야할까 고민하다가 **SceneDelegate** 를 이용해보았다.

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let startboard = UIStoryboard(name:"Main", bundle: nil)
        let secondviewcontroller = startboard.instantiateViewController(identifier: "customTabbarController")
        if UserDefaults.standard.string(forKey: "autoid") != nil {
            self.window?.rootViewController = secondviewcontroller
            self.window?.makeKeyAndVisible()
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
```
**scene( ) 함수** 는 앱에 scene에 추가될때 호출되는 함수이기 때문에, 이 함수에서 자동로그인 상태인지 판단을 해줬다.<br>
자동로그인을 눌렀을 때 공유객체에 값을 저장해 두었는데,  autoid에 값이 비어있지 않다면 자동로그인 상태이므로 바로 홈 화면이 있는 Tab으로 이동을 시켜주었다.<br>
만약 값이 없다면 원래대로 로그인 화면으로 Scence가 띄어진다.

- 자동로그인 후 로그아웃

```swift
@IBAction func Logout(_ sender: UIButton) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginNavi") as? LoginNavigationViewController else {return}

        UserDefaults.standard.removeObject(forKey: "autoid")
        UserDefaults.standard.removeObject(forKey: "autopw")

        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: true, completion: nil)
```
자동로그인을 해제하기위해 로그아웃 버튼을 생성해주었다. <br>
로그아웃 버튼을 눌렀을 때 **1.로그인 화면으로 이동한다** **2.자동로그인이 해제된다** 이렇게 두가지 역할을 해줘한다. <br>
자동로그인 해제를 위해 자동로그인 공유 변수에 저장해두었던 value 값을 removeObject를 통해 지워준다.


~~이번 과제 불태웠다.. 최선을 다했어요 ㅠ-ㅠ~~~~
