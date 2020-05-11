//
//  CameraCordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 11/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class CameraCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CameraController()
        vc.tabBarItem.image = UIImage(named: "camera")
        vc.tabBarItem.title = "Camera"
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
}

