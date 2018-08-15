//
//  AlbumsViewController.swift
//  TaskO
//
//  Created by Ulan Nurmamatov on 8/15/18.
//  Copyright © 2018 Ulan Nurmamatov. All rights reserved.
//

import UIKit

class AlbumsViewController: UIViewController {
    var collectionView: UICollectionView!
    private lazy var viewModel = AlbumsListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.getAlbums { (success, message) in
            self.collectionView.reloadData()
        }
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .clear
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AlbumCollectionViewCell.self))
        view.addSubview(collectionView)
        collectionView.fillSuperView()
    }
}

extension AlbumsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AlbumCollectionViewCell.self), for: indexPath) as! AlbumCollectionViewCell
        cell.configure(data: viewModel.randomAlbums[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.randomAlbums.count
    }
}

extension AlbumsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        photosViewController.albumId = viewModel.randomAlbums[indexPath.row].id
        navigationController?.pushViewController(photosViewController, animated: true)
    }
}
