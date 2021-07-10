//
//  GalleryController.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class GalleryController: UIViewController {

    weak var coordinator: GalleryCoordinator?
    private var gridView = GridView()
    var images = [UIImage?]()
    
    init() {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gridView.setPhotos(photos: getSavedPhotos())
    }
    
    private func setupViews() {
        view.addSubview(gridView)
        gridView.tappedOnPhoto = { [weak self] photo in
            self?.coordinator?.didTapOnPhoto(photo: photo)
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        gridView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func getSavedPhotos() -> [Photo] {
        return ImageStore.getSavedPhotos()
    }
}
