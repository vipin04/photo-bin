//
//  GalleryFullScreenView.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 09/07/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import UIKit
import SnapKit

class GalleryFullScreenView: UIView {
    
    private let imageView: UIImageView = {
        let imView = UIImageView(frame: .zero)
        imView.contentMode = .scaleAspectFit
        return imView
    }()
    
    required init() {
        super.init(frame: .zero)
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func populate(photo: Photo) {
        imageView.image = photo.image
    }
}
