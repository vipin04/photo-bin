//
//  CameraHandler.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 26/04/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import Foundation
import UIKit

enum CameraError: String, Error {
    case permissionDenied = "Permission denied by the user"
    case cameraUnavailable = "Camera is not available on the device"
}

class CameraHandler: NSObject {
    
    weak var coordinator: CameraCoordinator?
    
    func openCamera(onVC vc: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            coordinator?.presentCameraPicker(picker: picker)
        }
    }
}

extension CameraHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        coordinator?.didCancelTakingImage()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageCaptured(image: image)
        }
    }
    
    private func imageCaptured(image: UIImage) {
        do {
            let name = getImageName()
            try ImageStore.saveImage(fileName: name, image: image)
            coordinator?.didFinishTakingImage(fileName: name)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    private func getImageName() -> String {
         "IMG" + String(Int(NSDate().timeIntervalSince1970))
    }
}
