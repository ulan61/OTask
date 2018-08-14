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
        return label
    }()
    
    override func configureCell() {
        selectionStyle = .none
    }
    
    override func configure(data: Post) {
        titleLabel.text = data.title
    }
    
    override func setupViews() {
        addSubViews([titleLabel])
        titleLabel.top(to: topAnchor, constant: 16).leading(to: leadingAnchor, constant: 16)
    }
}
