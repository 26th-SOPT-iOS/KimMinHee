//
//  ChattingViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 12/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController {
    private var friendsInformation: [FriendsInformation]=[]
    
    // 도전과제 : ActionSheet 만들기
    @IBAction func settingButton(_ sender: Any) {
        let actionSheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        //맨 밑 취소
        let cancleAction: UIAlertAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel)
        actionSheet.addAction(cancleAction)
        // 친구 관리
        let friendsEdit: UIAlertAction = UIAlertAction(title: "친구 관리", style: UIAlertAction.Style.default)
        actionSheet.addAction(friendsEdit)
        // 전체 설정
        let allSetting: UIAlertAction = UIAlertAction(title: "전체 설정", style: UIAlertAction.Style.default)
        actionSheet.addAction(allSetting)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var ChattingTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setdataInformations()
        myNavigation()
        MyTabBar()
        ChattingTableView.dataSource = self
        ChattingTableView.delegate = self
        ChattingTableView.separatorStyle = .none //구분선 제거
        
    }
    private func setdataInformations() {
        let data1 = FriendsInformation(profile: .peach, name: "김민희", message: "")
        let data2 = FriendsInformation(profile: .apple, name: "김사과", message: "마라탕 선착순 100명")
        let data3 = FriendsInformation(profile: .strawberry, name: "박딸기", message: "중간고사 끝!")
        let data4 = FriendsInformation(profile: .watermelon, name: "박수박", message: "근데 왜 이렇게 바쁜거야")
        let data5 = FriendsInformation(profile: .orange, name: "최오렌지", message: "오렌지 1박스 12000원 카톡주세요")
        let data6 = FriendsInformation(profile: .banana, name: "남궁바나나", message: "방금 김민희 빠삐코 먹음")
        let data7 = FriendsInformation(profile: .greenapple, name: "진청사과", message: "요즘 자주 듣는 노래 - 찐이야")
        let data8 = FriendsInformation(profile: .plum, name: "최자두", message: "")
        let data9 = FriendsInformation(profile: .grape, name: "진포도", message: "민희야 잠이 자고싶어?-_-")
        let data10 = FriendsInformation(profile: .potato, name: "햇감자", message: "나는야 감자튀김이 될꺼야")

        
        friendsInformation = [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10]

    }
    private func MyTabBar() {
        
        //tabBarController?.tabBar.tint
        
        //tabBarController?.tabBarItem.image = UIImage(named: "setting_ic")
    }
    private func myNavigation() {
        // 상단 아이템 black으로 변경
        navigationController?.navigationBar.tintColor = UIColor.black
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        //navigationBar bottom bolder line 제거
        let longTitleLabel = UILabel()
        longTitleLabel.text = "친구"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        longTitleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        navigationItem.leftBarButtonItem = leftItem
    }
}
extension ChattingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            return 1
        } else {
            return friendsInformation.count-1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else { return UITableViewCell() }
        if indexPath.section == 0 {
            friendsCell.imageWidth.constant = 60
            friendsCell.labelHeight.constant = 33
            friendsCell.nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
            friendsCell.nameLabel.frame = CGRect.init(x: 20, y: 0, width: 44, height: 20)
            friendsCell.friendsInformation(profile: friendsInformation[0].profile.getImageName(),name: friendsInformation[0].name, message: friendsInformation[0].message)

            return friendsCell
            
        }else {
            friendsCell.imageWidth.constant = 50
            friendsCell.friendsInformation(profile: friendsInformation[indexPath.row+1].profile.getImageName(),name: friendsInformation[indexPath.row+1].name, message: friendsInformation[indexPath.row+1].message)
            return friendsCell }
    }
    
}
    

extension ChattingViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 88.5
        } else {
            return 62
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))

        let header = UILabel()
        let numOfFriends = UILabel()

        header.text = "친구 "
        header.font = UIFont.systemFont(ofSize: 12)
        header.frame = CGRect.init(x: 16, y: 0, width: 50, height: 30)
        header.textColor = UIColor.lightGray
        
        numOfFriends.text = "\(friendsInformation.count-1)"
        numOfFriends.font = UIFont.systemFont(ofSize: 11)
        numOfFriends.frame = CGRect.init(x: 40, y: 0, width: 50, height: 30)
        numOfFriends.textColor = UIColor.lightGray
        view.addSubview(header)
        view.addSubview(numOfFriends)
        
        // 내 프로필과 친구 목록 사이 구분선 추가
        let sepFrame = CGRect(x: 0, y: -9.5, width: 375, height: 1)
        let seperatorView = UIView(frame: sepFrame)
        seperatorView.backgroundColor = UIColor.lightGray
        header.addSubview(seperatorView)

        return view
    }
    
    // 친구 목록 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if editingStyle == UITableViewCell.EditingStyle.delete {
                friendsInformation.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                
        }
        }
    }
}
