//
//  GridCell.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 28/06/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    private var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        imageView = UIImageView()
        guard let imgView = imageView else { return }
        
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setPhoto(photo: Photo?) {
        self.imageView?.image = photo?.image
    }
}
