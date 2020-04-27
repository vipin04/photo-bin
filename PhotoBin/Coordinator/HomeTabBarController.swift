//
//  HomeTabBarControler.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        initialSetup()
    }
    
    private func initialSetup() {
        let controllers = [
            customise(controller: CameraController(), title: "Camera", imageName: "camera"),
            customise(controller: GalleryController(), title: "Gallery", imageName: "gallery"),
            customise(controller: SearchController(), title: "Search", imageName: "search"),
            customise(controller: SettingsController(), title: "Settings", imageName: "settings")
        ]
        
        viewControllers = controllers
    }
    
    private func customise(controller: UIViewController,
                           title: String,
                           imageName: String) -> UIViewController {
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.title = title
        return controller
    }
}
