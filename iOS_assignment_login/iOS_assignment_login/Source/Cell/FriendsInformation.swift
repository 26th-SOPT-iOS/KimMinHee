//
//  FriendsInformation.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 13/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
struct FriendsInformation {
    var profile: Profile
    var name: String
    var message: String
    
    init(profile: Profile, name: String, message: String) {
        self.profile = profile
        self.name = name
        self.message = message
    }
}
enum Profile {
    case peach
    case apple
    case strawberry
    case watermelon
    case grape
    case banana
    case greenapple
    case plum
    case orange
    case potato
    
    func getImageName() -> String {
        switch self {
        case .peach: return "복숭아"
        case .apple: return "사과"
        case .strawberry: return "딸기"
        case .watermelon: return "수박"
        case .grape: return "포도"
        case .banana: return "바나나"
        case .greenapple: return "청사과"
        case .plum: return "자두"
        case .orange: return "오렌지"
        case .potato: return "감자"
        }
    }
}
