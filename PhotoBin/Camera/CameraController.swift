//
//  CameraController.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class CameraController: UIViewController {

    weak var coordinator: CameraCoordinator?
    private let cameraHandler = CameraHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        openCamera()
    }
    
    private func initialSetup() {
        cameraHandler.coordinator = coordinator
    }
    
    private func openCamera() {
        cameraHandler.openCamera(onVC: self)
    }
}
