//
//  Music.swift
//  iOS_3rd_Seminar
//
//  Created by 김민희 on 09/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

// Music 모델
struct Music {
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: title)
        self.musicTitle = coverName
        self.singer = singer
    }
    
}
