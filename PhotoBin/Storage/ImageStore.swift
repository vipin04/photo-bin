//
//  ImageStore.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 27/06/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import Foundation
import UIKit

struct ImageStore {
    
    static let SAVED_PHOTOS = "SavedPhotos"
    
    static func saveImage(image: UIImage) throws -> Photo{
        do {
            let photo = try Photo(image: image)
            try Self.savePhoto(photo: photo)
            return photo
        } catch let error {
            throw error
        }
    }
    
//    static func getImages() -> [UIImage?] {
//        let fileNames = Self.getSavedFileNames()
//        let images: [UIImage?] = fileNames.map {
//            if let fileURL = getPathFor(fileName: $0) {
//                return UIImage(contentsOfFile: fileURL.path)
//            }
//            return nil
//        }
//        return images
//    }
    
    private static func savePhoto(photo: Photo) throws {
        var photos = getSavedPhotos()
        photos.append(photo)
        let userDefaults = UserDefaults.standard
        do {
            try userDefaults.setObject(photos, forKey: SAVED_PHOTOS)
        }
        catch let error {
            throw error
        }
    }
    
    static func getSavedPhotos() -> [Photo] {
        let userDefaults = UserDefaults.standard
        let photos = try? userDefaults.getObject(forKey: SAVED_PHOTOS, castTo: [Photo].self)
        return photos ?? []
    }
}
