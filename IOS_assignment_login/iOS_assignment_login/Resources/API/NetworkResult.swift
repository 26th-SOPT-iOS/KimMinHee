//
//  NetworkResult.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 16/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
enum NetworkResult<T> {
    case success(T) //성공
    case requestErr(T) //요청에러
    case pathErr //경로에러
    case serverErr //서버내부에러
    case networkFail //네트워크연결실패
}
