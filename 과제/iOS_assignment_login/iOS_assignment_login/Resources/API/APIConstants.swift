//
//  APIConstants.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 16/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
struct APIConstants {
    static let baseURL = "http://13.209.144.115:3002"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
    static let profileURL = APIConstants.baseURL + "/usre/profile"
}

