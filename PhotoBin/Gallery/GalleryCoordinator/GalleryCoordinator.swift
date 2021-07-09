//
//  GalleryCoordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 11/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

protocol GalleryCoordinatorDelegate: AnyObject {
    func detailsScreenShown()
    func rootScreenShown()
}

class GalleryCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: GalleryCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = GalleryController()
        vc.tabBarItem.image = UIImage(named: "gallery")
        vc.tabBarItem.title = "Gallery"
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didTapOnPhoto(photo: Photo) {
        let vc = GalleryFullScreenVC(withPhoto: photo)
        navigationController.pushViewController(vc, animated: true)
        delegate?.detailsScreenShown()
    }
}

extension GalleryCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let _ = fromViewController as? GalleryFullScreenVC {
            // We're popping a GalleryFullScreenVC view controller
            delegate?.rootScreenShown()
        }
    }
}
