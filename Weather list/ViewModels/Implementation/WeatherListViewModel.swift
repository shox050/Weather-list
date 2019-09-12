//
//  WeatherListViewModel.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherListViewModel {
    
    var selectedWeather: Weather?
    var weatherArray: [Weather] = []
    var didRequest = false
    
    private let imageParser: ImageParsable = ImageParser()
    private let networkService = NetworkService()
    private let weatherResponseConverter: WeatherResponseConvertable = WeatherResponseConvertert()
    private let weatherQueue = DispatchQueue(label: "weatherQueue", qos: .background, attributes: .concurrent)
    
    func getWeatherInCity(byName name: String, _ completion: @escaping (Result<Weather, FailResponse>) -> Void) {
        
        networkService.getWeatherInCity(byName: name) { [weak self] response in
            
            guard let this = self else { return }
            
            switch response {
            case .success(let weatherResponse):
                let weather = this.weatherResponseConverter.convert(weatherResponse)
                this.weatherArray.append(weather)
                completion(.success(weather))
            case .failure(let failResponse):
                completion(.failure(failResponse))
            }
        }
    }
    
    func getIcon(forWeather weather: Weather, _ completion: @escaping (Int) -> Void) {
        
        weatherQueue.async { [weak self] in
            guard let this = self else { return }
            
            this.networkService.getIcon(byId: weather.iconId) { response in
                switch response {
                case .success(let data):
                    guard let image = this.imageParser.parse(fromData: data) else {
                        print(ResponseError.parsing.reason)
                        return
                    }
                    
                    guard let index = this.weatherArray.firstIndex(where: {
                        $0.cityName == weather.cityName
                    }) else { return }
                    
                    this.weatherArray[index].icon = image
                    
                    completion(index)
                    
                case .failure(let error):
                    print("WeatherListViewModel getIcon by id response error: ", error)
                }
            }
        }
    }
    
    func getCityName(forLocation location: CLLocation, _ completion: @escaping (String) -> Void) {
        weatherQueue.async { [weak self] in
            guard let this = self else { return }
            this.getPlace(forLocation: location) { placemark in
                guard let placemark = placemark else { return }
                if let cityName = placemark.locality {
                    print("cityName is \(cityName)")
                    completion(cityName)
                }
            }
        }
    }

    private func getPlace(forLocation location: CLLocation, _ completion: @escaping(CLPlacemark?) -> Void) {
        
        weatherQueue.async {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                
                guard error == nil else {
                    print("Error in \(#function): \(error)")
                    completion(nil)
                    return
                }
                
                guard let placemark = placemarks?.first else {
                    print("Error in \(#function): placemark is nil")
                    completion(nil)
                    return
                }
                completion(placemark)
            }
        }
    }
}
