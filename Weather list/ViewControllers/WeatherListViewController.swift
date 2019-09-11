//
//  WeatherListViewController.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WeatherListViewController: UITableViewController {
    
    private var didInitialRequest = false
    private let weatherListViewModel = WeatherListViewModel()
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}

// MARK: - UITableViewDataSource
extension WeatherListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else {
            return UITableViewCell()
        }
        
        weatherCell.configure(byWeather: weatherListViewModel.weatherArray[indexPath.row])
        
        return weatherCell
    }
}


// MARK: - UITableViewDelegate
extension WeatherListViewController {
    
}

// MARK: - CLLocationManagerDelegate
extension WeatherListViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !didInitialRequest {
            didInitialRequest = true
            
            guard let location = locations.first else { return }
            initialSetup(withLocation: location)
        }

    }
}

extension WeatherListViewController {
    func initialSetup(withLocation location: CLLocation) {
        
        DispatchQueue.global().async { [weak self] in
            
            guard let this = self else { return }
            
            this.weatherListViewModel.getCityName(forLocation: location) { cityName in
                this.weatherListViewModel.getWeatherInCity(byName: cityName) {
                    
                    DispatchQueue.main.sync {
                        this.tableView.reloadData()
                    }
                    
                    guard let initialWeather = this.weatherListViewModel.weatherArray.first else {
                        print("No weather in weather array, \(#function)")
                        return
                    }
                    this.weatherListViewModel.getIcon(forWeather: initialWeather) { index in
                        let indexPath = IndexPath(row: index, section: 0)
                        this.tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
    }
}
