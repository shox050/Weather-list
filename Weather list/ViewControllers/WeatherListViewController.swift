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
    
    @IBAction private func addNewCity(_ sender: UIBarButtonItem) {
        addNewCity(title: "Add new city", message: "Enter the name")
    }
    
    
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
                this.weatherListViewModel.getWeatherInCity(byName: cityName) { weather in
                    
                    DispatchQueue.main.sync {
                        this.tableView.reloadData()
                    }

                    this.weatherListViewModel.getIcon(forWeather: weather) { index in
                        let indexPath = IndexPath(row: index, section: 0)
                        this.tableView.reloadRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
    }
    
    private func addNewCity(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField()
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] _ in
            
            guard let this = self else { return }
            
            guard let textField = alert.textFields?.first, let text = textField.text else {
                print("No textField in Alert: \(#function)")
                return
            }
            
            this.weatherListViewModel.getWeatherInCity(byName: text, { weather in
                DispatchQueue.main.sync {
                    this.tableView.reloadData()
                }
                
                this.weatherListViewModel.getIcon(forWeather: weather) { index in
                    let indexPath = IndexPath(row: index, section: 0)
                    this.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
