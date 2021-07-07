//
//  GridView.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 27/06/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import UIKit
import SnapKit

class GridView: UIView {
    private var collectionView: UICollectionView?
    private let selectedImageName: String?
    private var images: [UIImage?]?
    
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
    
    func setImages(images: [UIImage?]) {
        self.images = images
        self.collectionView?.reloadData()
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
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.register(GridCell.self, forCellWithReuseIdentifier: "cellId")
    }
}

extension GridView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        (cell as? GridCell)?.setImage(img: self.images?[indexPath.row])
        return cell
    }
}

extension GridView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = interCellSpacing * (itemsPerRow) - interCellSpacing
        let availableWidth = self.frame.width - paddingSpace
        let widthPerItem =  availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

}
