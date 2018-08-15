//
//  BaseCollectionViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class BaseCollectionViewCell<T>: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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

