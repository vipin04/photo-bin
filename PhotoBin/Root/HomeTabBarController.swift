//
//  HomeTabBarControler.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let cameraCoordinator = CameraCoordinator(navigationController: UINavigationController())
    let galleryCoordinator = GalleryCoordinator(navigationController: UINavigationController())
    let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initialSetup()
    }
    
    private func initialSetup() {
        let coordinatorsArray: [Coordinator] = [cameraCoordinator,
                                                galleryCoordinator,
                                                searchCoordinator,
                                                settingsCoordinator]
        
        coordinatorsArray.forEach{
            $0.start()
        }
        
        viewControllers = [
            cameraCoordinator.navigationController,
            galleryCoordinator.navigationController,
            searchCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        self.viewControllers = viewControllers
        cameraCoordinator.delegate = self
        galleryCoordinator.delegate = self
    }
    
    private func navigateToGallery() {
        self.selectedIndex = viewControllers?.firstIndex(of: galleryCoordinator.navigationController) ?? 1
    }
}

extension MainTabBarController: CameraCoordinatorDelegate, GalleryCoordinatorDelegate {
    func didCancelTakingImage() {
        navigateToGallery()
    }
    
    func didFinishTakingImage(photo: Photo) {
        navigateToGallery()
    }
    
    func detailsScreenShown() {
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let oldFrame = self?.tabBar.frame else { return }
            self?.tabBar.frame = CGRect(x:oldFrame.minX,
                                        y:oldFrame.minY + oldFrame.height,
                                        width: oldFrame.width,
                                        height: oldFrame.height)
        }
    }
    
    func rootScreenShown() {
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let oldFrame = self?.tabBar.frame else { return }
            self?.tabBar.frame = CGRect(x:oldFrame.minX,
                                        y:oldFrame.minY - oldFrame.height,
                                        width: oldFrame.width,
                                        height: oldFrame.height)
        }
    }
}
