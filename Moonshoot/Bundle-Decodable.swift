//
//  Bundle-Decodable.swift
//  Moonshoot
//
//  Created by Harish on 28/12/22.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("\(file) not located on bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Not able to load the data on \(file)")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return decoded
    }
}
