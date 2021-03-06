//
//  PostTableViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class PostTableViewCell: BaseTableViewCell<Post> {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func configureCell() {
        selectionStyle = .none
    }
    
    override func configure(data: Post) {
        titleLabel.text = data.title
        bodyLabel.text = data.body
    }
    
    override func setupViews() {
        addSubViews([titleLabel, bodyLabel])
        titleLabel.top(to: topAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8).bottom(to: bodyLabel.topAnchor, constant: 8)
        bodyLabel.bottom(to: bottomAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8)
    }
}
