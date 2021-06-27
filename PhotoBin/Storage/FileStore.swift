//
//  FileStore.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 27/06/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import Foundation

struct FileStore {
    
    static let SAVED_FILE_NAMES = "SavedFileNames"
    
    static func saveFile(fileName: String, data: Data) throws {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL)
            saveFileName(fileName: fileName)
            print("file saved: \(fileName)")
        } catch let error {
            throw error
        }
    }
    
    private static func saveFileName(fileName: String) {
        var fileNames = getSavedFileNames()
        fileNames.append(fileName)
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(fileNames, forKey: SAVED_FILE_NAMES)
    }
    
    static func getSavedFileNames() -> [String] {
        let userDefaults = UserDefaults.standard
        return userDefaults.object(forKey: SAVED_FILE_NAMES) as? [String] ?? []
    }
}
