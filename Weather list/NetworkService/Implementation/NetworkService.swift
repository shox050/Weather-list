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
                         parameters: [String:Any]? = nil,
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
    
    func getWeatherInCity(byName name: String, _ completion: @escaping (Result<WeatherResponse, FailResponse>) -> Void) {
        
        let requestParameters = RequestParameters(cityName: name)
        let parametersEncoded = dictionaryEncoder.encode(entity: requestParameters)
        
        request(.weather, parameters: parametersEncoded) { response in
            
            guard let responseData = response.data else {
                print("getWeatherInCity byName сant get data from response: ", response.error)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            
            do {
                if let weather = try? jsonDecoder.decode(WeatherResponse.self, from: responseData) {
                    completion(.success(weather))
                } else if let failResponse = try? jsonDecoder.decode(FailResponse.self, from: responseData) {
                    completion(.failure(failResponse))
                }
            }
        }
    }
    
    func getIcon(byId id: String, _ completion: @escaping (Result<Data, Error>) -> Void) {
        
        let path = "http://openweathermap.org/img/wn/\(id)@2x.png"
        guard let pathUrl = URL(string: path) else {
            print("Cant create pathUrl for get icon")
            return
        }
        
        AF.request(pathUrl).validate().responseData { response in
            print("Func get icon request: ", response.request)
            guard let responseData = response.data else {
                print("getIcon by id get error: ", response.error)
                completion(.failure(ResponseError.network))
                return
            }
            
            completion(.success(responseData))
        }
    }
}
