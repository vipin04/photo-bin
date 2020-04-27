//
//  CameraController.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

class CameraController: UIViewController {

    private let cameraHandler = CameraHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        openCamera()
    }
    
    private func openCamera() {
        cameraHandler.imagePickedBlock = { image in
            if let capturedImage = image {
                print(capturedImage)
            }
        }
        cameraHandler.openCamera(onVC: self)
    }
}
