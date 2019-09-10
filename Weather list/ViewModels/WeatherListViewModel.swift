//
//  WeatherListViewModel.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import MapKit

class WeatherListViewModel {
    
    var weather: [Weather] = []
    
    private let networkService = NetworkService() // Add type Protocol
    
    func getCity(byCoordinate coordinate: CLLocationCoordinate2D, _ completion: @escaping () -> Void) {
        
        networkService.getCity(byCoordinate: coordinate) { [weak self] response in
            
            guard let this = self else { return }
            
            switch response {
            case .success(let weather):
                this.weather.append(weather)
            case .failure(let error):
                print("WeatherListViewModel getCitybyCoordinate response error: ",error)
            }
        }
    }
}
