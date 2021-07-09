//
//  GridView.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 27/06/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import UIKit
import SnapKit

enum Section {
    case main
}
typealias DataSource = UICollectionViewDiffableDataSource<Section, Photo>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Photo>

class GridView: UIView {
    
    private var collectionView: UICollectionView?
    private lazy var dataSource = createDataSource()
    private let selectedImageName: String?
    private var photos: [Photo]?
    
    private let interCellSpacing: CGFloat = 1
    
    private let itemsPerRow: CGFloat = 3
    
    required init(selectedImageName: String? = nil) {
        self.selectedImageName = selectedImageName
        super.init(frame: .zero)
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    func setPhotos(photos: [Photo]) {
        self.photos = photos
        applySnapshot()
    }
    
    func applySnapshot(animatingDifference: Bool = true) {
        guard let photosArr = photos else { return }
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(photosArr)
        dataSource?.apply(snapshot, animatingDifferences: animatingDifference)
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        createCollectionView()
        
        guard let colView = collectionView else { return }
        self.addSubview(colView)
        colView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1;
        layout.minimumLineSpacing = 1;

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.register(GridCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    private func createDataSource() -> DataSource? {
        guard let cView = collectionView else { return nil }
        let dataSource = DataSource(collectionView: cView) { (colView, indexPath, photoModel) -> UICollectionViewCell? in
            let cell = colView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            (cell as? GridCell)?.setPhoto(photo: self.photos?[indexPath.row])
            return cell
        }
        return dataSource
    }
}

extension GridView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = interCellSpacing * (itemsPerRow) - interCellSpacing
        //TODO: Replace UIScreen width with the GridView's width
        let availableWidth = UIScreen.main.bounds.width - paddingSpace
        let widthPerItem =  availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}
