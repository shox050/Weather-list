//
//  ResponseError.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    case network
    case decoding
    case encoding
    case parsing
    
    var reason: String {
        switch self {
        case .network:
            return "An error occurred while fetching data"
        case .decoding:
            return "An error occurred while decoding data"
        case .encoding:
            return "An error occurred while encoding data"
        case .parsing:
            return "An error occured while parsing data"
        }
    }
}
