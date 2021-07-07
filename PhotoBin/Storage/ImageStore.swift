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
    
    static let SAVED_FILE_NAMES = "SavedFileNames"
    
    static func saveImage(fileName: String, image: UIImage) throws {
        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
        guard let fileURL = getPathFor(fileName: fileName) else { return }
        
        do {
            try data.write(to: fileURL)
            saveFileName(fileName: fileName)
        } catch let error {
            throw error
        }
    }
    
    static func getImages() -> [UIImage?] {
        let fileNames = Self.getSavedFileNames()
        let images: [UIImage?] = fileNames.map {
            if let fileURL = getPathFor(fileName: $0) {
                return UIImage(contentsOfFile: fileURL.path)
            }
            return nil
        }
        return images
    }
    
    private static func saveFileName(fileName: String) {
        var fileNames = getSavedFileNames()
        fileNames.append(fileName)
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(fileNames, forKey: SAVED_FILE_NAMES)
        print("files: \(fileNames)")
    }
    
    static func getSavedFileNames() -> [String] {
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: SAVED_FILE_NAMES) as? [String] ?? []
    }
    
    static private func getPathFor(fileName: String) -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent(fileName)
    }
}
