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
    case jihyun
    case haeun
    case dayeon
    case hyemi
    case yeonju
    
    func getImageName() -> String {
        switch self {
        case .jihyun: return "새1"
        case .haeun: return "새2"
        case .dayeon: return "새3"
        case .hyemi: return "새4"
        case .yeonju: return "새5"
            
        }
    }
}
