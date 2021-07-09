//
//  Photo.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 08/07/21.
//  Copyright © 2021 Vipin Aggarwal. All rights reserved.
//

import Foundation
import UIKit

struct Photo: Hashable, Codable {
    var id = UUID()
    var dateTime = Date()
    
    init(image: UIImage) throws {
        
        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
        guard let fileURL = Self.getPathFor(fileName: id.uuidString) else { return }
        
        do {
            try data.write(to: fileURL)
            //TODO: Save ids to persistent store also. If someone creates Photo object and never intends to save image file, we will be wasting user's storage as we have already written image file to disk.
        } catch let error {
            throw error
        }
    }
    
    //TODO: Image fetching should be done async. See where that code should go
    // Fetching images async one by one can be costly. 
    var image: UIImage? {
        if let fileURL = Self.getPathFor(fileName: id.uuidString) {
            return UIImage(contentsOfFile: fileURL.path)
        }
        return nil
    }
    
    //TODO: Make provision for providing thumnail image
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs:Photo, rhs: Photo) -> Bool {
        lhs.id == rhs.id
    }
    
    static private func getPathFor(fileName: String) -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documentsDirectory.appendingPathComponent(fileName)
    }
}
