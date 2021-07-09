//
//  GalleryCoordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 11/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class GalleryCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = GalleryController()
        vc.tabBarItem.image = UIImage(named: "gallery")
        vc.tabBarItem.title = "Gallery"
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didTapOnPhoto(photo: Photo) {
        let vc = GalleryFullScreenVC(withPhoto: photo)
        navigationController.pushViewController(vc, animated: true)
    }
}
