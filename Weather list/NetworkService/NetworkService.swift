//
//  NetworkService.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire
import MapKit

class NetworkService {
    
    private let executionQueue = DispatchQueue(label: "NetworkExecutionQueue", qos: .background, attributes: .concurrent)
    
    private let dictionaryEncoder = DictionaryEncoder()
    
    
    private func request(_ endpoint: Endpoint,
                         method: HTTPMethod = .get,
                         parameters: [String:Any]?,
                         _ completion: @escaping (DataResponse<Data>) -> Void) {
        
        AF.request(endpoint,
                   method: method,
                   parameters: parameters)
            .validate()
            .responseData(queue: executionQueue) { response in
                
                print("Request ", response.request)
                completion(response)
        }
    }
    
    func getCity(byCoordinate coordinate: CLLocationCoordinate2D, _ completion: @escaping (Result<Weather, Error>) -> Void) {
        
        let requestParameters = RequestParameters(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let parametersEncoded = dictionaryEncoder.encode(entity: requestParameters)
        
        request(.weather, parameters: parametersEncoded) { response in
            
            guard let responseData = response.data else {
                print("getCity by coordinate get error: ", response.error)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let weather = try jsonDecoder.decode(Weather.self, from: responseData)
                completion(.success(weather))
            } catch let error {
                print("getCity get error with decoding: ", error)
                completion(.failure(ResponseError.decoding))
            }
        }
    }
    
    func getIcon(byId id: String, _ completion: @escaping (Result<Data, Error>) -> Void) {
        
    }
}
