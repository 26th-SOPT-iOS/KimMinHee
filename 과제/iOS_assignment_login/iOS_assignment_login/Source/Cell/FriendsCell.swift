//
//  FriendsCell.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 13/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
protocol ButtonDelegate {
    func onClickCellButton(in index: Int)
}

class FriendsCell: UITableViewCell {
    static let identifier: String = "FriendsCell"
    //@IBOutlet weak var profileImageView: UIImageView!
    // 친구들 프로필 사진
    @IBOutlet weak var nameLabel: UILabel!
    // 친구들 이름
    @IBOutlet weak var messageLabel: UILabel!
    // 친구들 상태 메세지
    
    @IBOutlet weak var imageButton: UIButton!
    //프로필사진 ver.버튼
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    
    var delegate: ButtonDelegate?
    var indexPath: IndexPath?
    
    @IBAction func setProfile(_ sender: Any) {
        delegate?.onClickCellButton(in: indexPath!.row)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        imageButton.imageView?.layer.cornerRadius = imageButton.frame.width / 2
        // 프로필사진 동그랗게 만들기
        //profileImageView.layer.masksToBounds = true
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func friendsInformation(profile: String, name: String, message: String){
        
        //imageButton.setImage(UIImage(named: profile), for: .normal)
        imageButton.setBackgroundImage(UIImage(named: profile), for: .normal)
        //projfileImageView.image = UIImage(named: profile)
        nameLabel.text = name
        messageLabel.text = message
        
    }

}
