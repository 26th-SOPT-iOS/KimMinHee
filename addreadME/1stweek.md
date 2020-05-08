## 🧸 1주차 과제 : 로그인, 회원가입 UI 구현하기 🧸

#### 세그(Segue) 구현
* 로그인 화면
	* 회원가입 Button

```python
guard let SignPush = self.storyboard?.instantiateViewController(identifier: "signViewController") as? SignViewController else {return}

self.navigationController?.pushViewController(SignPush, animated: true)
```
회원가입 Button은 push로 전달합니다.

	* 로그인 Button
 
```python
guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "loginViewController") as? LoginViewController else {return}

receiveViewController.modalPresentationStyle = .fullScreen
self.present(receiveViewController, animated: true, completion: nil)
```
*로그인하기*  Button은 present 방식으로 전환합니다.


#### 값 전달하기

✅ 메인화면에서 로그인버튼 Click시 화면에 입력된 id,pw 값 다음 화면으로 전달

<img width="458" alt="1stweek 값전달" src="https://user-images.githubusercontent.com/51286963/81373078-d7065780-9136-11ea-9dc8-97db37947d0a.png">

```python
private func setLables() {
    guard let yourId = self.yourId else{return}
    guard let yourPw = self.yourPw else{return}
        
    idTextField.text = yourId
    pwTextField.text = yourPw
        
    }
```
id와 pw를 전달받기 위해 let으로 상수 선언하고

```python
	receiveViewController.yourId = idTextField.text
    receiveViewController.yourPw = pwTextField.text
```
값을 전달해 줄 Controller에서 TextField의 값을 넘겨줍니다.


