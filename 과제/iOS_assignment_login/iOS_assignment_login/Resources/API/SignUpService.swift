//
//  SignUpService.swift
//  iOS_assignment_login
//
//  Created by 김민희 on 20/05/2020.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService() // 싱글톤 객체
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String) -> Parameters { return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
    }
    
    func signup(id: String, pwd: String, name: String, email: String, phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {

                  let header: HTTPHeaders = ["Content-Type": "application/json"]
                        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd,name,email,phone), encoding: JSONEncoding.default, headers: header)
        
                        dataRequest.responseData { dataResponse in switch dataResponse.result {
                        case .success:
                                guard let statusCode = dataResponse.response?.statusCode else { return }
                                guard let value = dataResponse.result.value else { return }
                                let networkResult = self.judge(by: statusCode, value)
                                completion(networkResult)
                        case .failure: completion(.networkFail)
                            }
                    }
            }

    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
    case 200: return isSignedUp(by: data)
    case 400: return .pathErr
    case 500: return .serverErr
    default: return .networkFail
        }
        
    }
    
    
    private func isSignedUp(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignupData.self, from: data) else { return .pathErr }
        
        if decodedData.success {return .success(data)}
        else {return .requestErr(decodedData.message)}
        
    }
    
}
