## 🧸 Network 통신 - 회원가입 API 요청하기 🧸

> #### API

* 회원가입 JSON Data

```swift
status = (try? values.decode(Int.self, forKey: .status)) ?? -1
success = (try? values.decode(Bool.self, forKey: .success)) ?? false
message = (try? values.decode(String.self, forKey: .message)) ?? ""
```
JSONDecoder를 사용할 때 error 검출을 위해 try를 사용한다.
만약 값이 있다면 **try? **뒤의 값을 반환하고 만약 값이 없다면 **??** 뒤의 값을 반환한다

* 회원가입 서버 통신 구현<br>
Q. *싱글톤 객체* 란?<br>
A. 객체를 하나만 생성해서 여러 곳에서 접근해 사용하고 싶을 때 사용하는 방법으로, 한번의 객체 생성만 이뤄지기 때문에 메모리 낭비를 방지할 수 있다

<img width="435" alt="signin parameter" src="https://user-images.githubusercontent.com/51286963/82601604-c819ad80-9bea-11ea-8fb5-e25ff2299b5c.png">

```swift
private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters { return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
```
로그인 요청과 달리 회원가입의 RequestBody에는 5개의 Parameter가 들어가는 것을 postman 요청을 통해 확인 한 후 5개의 값을 넣어주었다
<br>
> #### 회원가입 후 자동 로그인
![회원가입_자동로그인](./사진/회원가입_자동로그인.gif)
- 회원가입 시 요구하는 정보를 모두 넣어준 후 회원가입 button을 누르면 login 페이지로 돌아감과 동시에 id와 pw가 채워진 채 자동 로그인이 되어야한다

```swift
SignUpService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
    }
```
앞에서 정의해 둔 싱글톤 객체를 통해 데이터 통신을 진행했다

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
login 버튼에 받아온 id와 pw를 넣어서 버튼을 클릭한 효과를 줬다

```swift
        case .success(let token):
            guard let token = token as? String else { return }
            UserDefaults.standard.set(token, forKey: "token")
            guard let tabbarController = self.storyboard?.instantiateViewController(identifier:"customTabbarController") as?
                UITabBarController else { return }
            tabbarController.modalPresentationStyle = .fullScreen
        self.present(tabbarController, animated: true, completion: nil)
```
로그인 요청을 보내 token을 이용하여 자동 로그인 기능을 구현하였다

- 회원가입 실패시

회원가입이 실패하는 경우에는 4가지 case가 존재한다

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
이 중 회원가입에서의 요청 error는 이미 존재하는 id를 사용했을 때 error가 발생하기 때문에 message와 함께 alter을 띄어준다

> #### CheckBox를 이용한 자동로그인

- BEMCheckBox(Cocoapod) 활용한 CheckBox 만들기

```
pod 'BEMCheckBox'
```
먼저 Alamofire와 Kingfisher를 설치해 둔 Podfile에 BEMCheckBox 코코아팟을 추가 설치해준다

```swift
import BEMCheckBox

let checkbox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(48), y: CGFloat(395), width: CGFloat(15), height: CGFloat(15)))
```
설치한 BEMCheckBox를 import 해주고 자리를 정해주면 화면에 띄어지게된다

Check Off             |  Check On
:-------------------------:|:-------------------------:
<img alt="자동로그인off" src="https://user-images.githubusercontent.com/51286963/82660309-19668300-9c65-11ea-9e61-ceeb782bdeef.png">  |  <img alt="자동로그인on" src="https://user-images.githubusercontent.com/51286963/82660322-1ec3cd80-9c65-11ea-8d77-56a021a1bdd4.png">
