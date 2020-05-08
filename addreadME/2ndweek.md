## 🧸 2주차 과제 : 로그인 화면 레이아웃 & 스크롤뷰 🧸

#### 레이아웃

* text Padding

<img width="246" alt="스크린샷 2020-05-08 오후 11 48 02" src="https://user-images.githubusercontent.com/51286963/81417723-91717b00-9186-11ea-9be2-a64224972738.png">

```python
extension UITextField {
    func addLeftPadding() {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: self.frame.height))
      self.leftView = paddingView
      self.leftViewMode = ViewMode.always
    }
}
```
TextField에서 내용 작성시 간격을 주기 위해 만든 함수로,
다른 Controller의 swift 파일에서도 이 함수를 가져다 사용할 수 있다

* Navigation Bar

```python
	self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
```
Navigation Bar를 투명하게 설정해서 보이지 않게 만들기
투명 불투명이 아닌 특정 색을 지정해 줄 수도 있음

<img width="457" alt="스크린샷 2020-05-08 오후 11 52 27" src="https://user-images.githubusercontent.com/51286963/81418111-21afc000-9187-11ea-8374-19e02d0f521e.png">

```python
		self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 7/255, green: 59/255, blue: 163/255, alpha: 1.0)
```
Navigation Bar의 title이 기본으로 "Back"이라고 되어있지만 공백으로 변경,
그리고 <의 컬러도 .tintColor로 원하는 색으로 변경가능