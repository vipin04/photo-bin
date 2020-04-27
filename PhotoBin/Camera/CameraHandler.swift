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
    
    weak var parentVC: UIViewController?
    var imagePickedBlock: ((UIImage?) -> Void )?
    
    func openCamera(onVC vc: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            parentVC = vc
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .camera
            parentVC?.present(picker, animated: true, completion: nil)
        }
    }
}

extension CameraHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parentVC?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imagePickedBlock?(image)
        } else {
            imagePickedBlock?(nil)
        }
        
        parentVC?.dismiss(animated: true, completion: nil)
    }
}
