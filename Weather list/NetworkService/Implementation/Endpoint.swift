//
//  Endpoint.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint: URLRequestConvertible {
    static let baseUrl = "http://api.openweathermap.org"
    
    case weather
    
    var path: String {
        switch self {
        case .weather:
            return "/data/2.5/weather"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let baseUrl = try Endpoint.baseUrl.asURL()
        let url = baseUrl.appendingPathComponent(path)
        
        return URLRequest(url: url)
    }
}


// MARK: - URLConvertible
extension Endpoint: URLConvertible {
    func asURL() throws -> URL {
        return try asURLRequest().url!
    }
}
