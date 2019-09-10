//
//  WeatherListViewController.swift
//  Weather list
//
//  Created by Vladimir on 10/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import MapKit

class WeatherListViewController: UITableViewController {
    
    private let weatherListViewModel = WeatherListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinate = CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423)
        
        weatherListViewModel.getCity(byCoordinate: coordinate) {
            print("COMPLETION")
        }
    }
}

// MARK: - UITableViewDataSource
extension WeatherListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherCell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else {
            return UITableViewCell()
        }
        
        
        return weatherCell
    }
}


// MARK: - UITableViewDelegate
extension WeatherListViewController {
    
}
