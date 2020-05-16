//
//  SignupData.swift
//  IOS_assignment_login
//
//  Created by 김민희 on 16/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//
/*
import Foundation
struct SignupData: Codable {
    
    var status: Int
    var success: Bool
    var message: String
    
    enum CodingKeys: String, CodingKey{
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? true
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(TokenData.self, forKey: .data)) ?? nil
    }
}

struct TokenData: Codable{
    var jwt: String
}
*/
