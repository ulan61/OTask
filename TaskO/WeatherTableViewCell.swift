//
//  WeatherTableViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class WeatherTableViewCell: BaseTableViewCell<Weather> {
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func configureCell() {
        selectionStyle = .none
    }
    override func configure(data: Weather) {
        cityLabel.text = data.city
        temperatureLabel.text = "\(Int(data.temperature.constant - 273.5))º"
    }
    
    override func setupViews() {
        addSubViews([cityLabel,temperatureLabel])
        cityLabel.top(to: topAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8).bottom(to: temperatureLabel.topAnchor, constant: 8)
        temperatureLabel.bottom(to: bottomAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8)
    }
    
}
