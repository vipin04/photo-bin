//
//  SettingsCoordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 11/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SettingsController()
        vc.tabBarItem.image = UIImage(named: "settings")
        vc.tabBarItem.title = "Settings"
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
}
