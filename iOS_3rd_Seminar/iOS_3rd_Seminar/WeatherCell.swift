//
//  WeatherCell.swift
//  iOS_3rd_Seminar
//
//  Created by 김민희 on 09/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    static let identifier: String = "WeatherCell"

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDateInformation(weatherImageName: String, date: String, subTitle: String){
        weatherImageView.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subTitleLable.text = subTitle
    }

}
