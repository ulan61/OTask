//
//  PostCommentTableViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class PostCommentTableViewCell: BaseTableViewCell<Comment> {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func configureCell() {
        selectionStyle = .none
    }
    
    override func configure(data: Comment) {
        nameLabel.text = data.name + ":"
        bodyLabel.text = data.body
    }
    
    override func setupViews() {
        addSubViews([nameLabel, bodyLabel])
        nameLabel.top(to: topAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8).bottom(to: bodyLabel.topAnchor, constant: 8)
        bodyLabel.bottom(to: bottomAnchor, constant: 16).leading(to: leadingAnchor, constant: 16).trailing(to: trailingAnchor, constant: 8)
    }
}
