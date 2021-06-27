//
//  CameraCordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 11/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

protocol CameraCoordinatorDelegate: AnyObject {
    func didFinishTakingImage(fileName: String)
    func didCancelTakingImage()
}

class CameraCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: CameraCoordinatorDelegate?
    
    var cameraVC: CameraController = {
        let vc = CameraController()
        vc.tabBarItem.image = UIImage(named: "camera")
        vc.tabBarItem.title = "Camera"
        return vc
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        cameraVC.coordinator = self
        navigationController.pushViewController(cameraVC, animated: true)
    }
    
    func presentCameraPicker(picker: UIImagePickerController) {
        cameraVC.present(picker, animated: true, completion: nil)
    }
    
    func didCancelTakingImage() {
        cameraVC.dismiss(animated: true, completion: nil)
        delegate?.didCancelTakingImage()
    }
    
    func didFinishTakingImage(fileName: String) {
        cameraVC.dismiss(animated: true, completion: nil)
        delegate?.didFinishTakingImage(fileName: fileName)
    }
}

