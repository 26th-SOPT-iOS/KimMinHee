//
//  ChattingViewController.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 12/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController {
    private var freindsInformation: [FriendsInformation]=[]
    
    @IBOutlet weak var ChattingTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        //navigationBar bottom bolder line 제거

        self.navigationItem.title = "친구"
        setdataInformations()
        ChattingTableView.dataSource = self
        ChattingTableView.delegate = self
    }
    private func setdataInformations() {
        let data1 = FriendsInformation(profile: .jihyun, name: "김지현", message: "배고프다..")
        let data2 = FriendsInformation(profile: .haeun, name: "손하은", message: "중간고사 끝!")
        let data3 = FriendsInformation(profile: .dayeon, name: "백다연", message: "과제 힘들어요")
        let data4 = FriendsInformation(profile: .hyemi, name: "여혜미", message: "방금 빠삐코 먹은사람?")
        let data5 = FriendsInformation(profile: .yeonju, name: "유연주", message: "바로 나야나")
        
        freindsInformation = [data1,data2,data3,data4,data5]
    }

}
extension ChattingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freindsInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsCell.identifier, for: indexPath) as? FriendsCell else {
        return UITableViewCell() }
        friendsCell.freindsInformation(profile: freindsInformation[indexPath.row].profile.getImageName(),
            name: freindsInformation[indexPath.row].name,
                                       message: freindsInformation[indexPath.row].message)
        return friendsCell
    }
    
}
extension ChattingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
        
    }
    
}
