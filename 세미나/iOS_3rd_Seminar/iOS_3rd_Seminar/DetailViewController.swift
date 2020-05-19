//
//  DetailViewController.swift
//  iOS_3rd_Seminar
//
//  Created by 김민희 on 09/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    //데이터를 받아올 곳
    var imageName: String = ""
    var date: String = ""
    var subTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    private func initView() {
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subTitleLabel.text = subTitle
    }

}
