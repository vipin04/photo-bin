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
    }
    
    private func customise(controller: UIViewController,
                           title: String,
                           imageName: String) -> UIViewController {
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.title = title
        return controller
    }
}
