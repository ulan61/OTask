//
//  BaseTableViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class BaseTableViewCell<T>: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //Properties of Cell
    func configureCell() {}
    
    //Data of cell
    func configure(data: T) {}
    
    //Add subviews to cell
    func setupViews() {}
}
