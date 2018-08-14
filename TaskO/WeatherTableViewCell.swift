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
        return label
    }()
    
    override func configureCell() {
        selectionStyle = .none
    }
    override func configure(data: Weather) {
        cityLabel.text = data.city
    }
    
    override func setupViews() {
        addSubViews([cityLabel])
        cityLabel.top(to: topAnchor, constant: 16).leading(to: leadingAnchor, constant: 16)
    }
    
}
