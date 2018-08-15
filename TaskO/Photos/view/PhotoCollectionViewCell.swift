//
//  PhotoCollectionViewCell.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: BaseCollectionViewCell<Photo> {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_setShowActivityIndicatorView(true)
        imageView.sd_setIndicatorStyle(.gray)
        return imageView
    }()
    
    override func configure(data: Photo) {
        imageView.sd_setImage(with: URL(string: data.thumbnailUrlString)!)
    }
    
    override func setupViews() {
        addSubViews([imageView])
        imageView.fillSuperView()
    }
}
