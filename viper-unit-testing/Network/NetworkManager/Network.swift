//
//  Network.swift
//  viper-unit-testing
//
//  Created by Ganang Arief Pratama on 03/09/20.
//  Copyright © 2020 ganang.id. All rights reserved.
//

import Foundation
import Alamofire

public enum Network: URLRequestConvertible {
    
    static let baseURLString = ConfigApps.getUrlVideo()
    
    case getCollections(params: [String: Any])
    
    var method : HTTPMethod {
        switch self {
        case .getCollections(_):
            return .get
        }
        
    }
    
    var res: (path: String, params: [String : Any]?) {
        switch self {
        case .getCollections(let params):
            return ("collections", params)
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        url = try Network.baseURLString.asURL()
        url?.appendPathComponent(res.path)
        
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = method.rawValue
        
        // Append Param
        if let params = res.params {
            print(params)
            urlRequest = try URLEncoding.default.encode(urlRequest!, with: params)
        }
        
        return urlRequest!
    }
}
