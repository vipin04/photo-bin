//
//  GalleryFullScreenVC.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 09/07/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import UIKit

class GalleryFullScreenVC: UIViewController {

    weak var coordinator: GalleryCoordinator?
    private let photo: Photo
    private var fullScreenView = GalleryFullScreenView()
    
    init(withPhoto photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(fullScreenView)
        fullScreenView.populate(photo:photo)
        setupConstraints()
    }
    
    private func setupConstraints() {
        fullScreenView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
