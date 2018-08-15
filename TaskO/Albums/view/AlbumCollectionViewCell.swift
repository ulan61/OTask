//
//  AlbumCollectionViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: BaseCollectionViewCell<Album> {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func configureCell() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
    }
    override func configure(data: Album) {
        titleLabel.text = data.title
    }
    
    override func setupViews() {
        addSubViews([titleLabel])
        titleLabel.centerX(to: centerXAnchor).centerY(to: centerYAnchor).width(constant: bounds.width - 32)
    }
}
