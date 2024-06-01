//
//  ResponseHandler.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation

class ResponseHandler {
    static let shared = ResponseHandler()
    
    static func parse<T: Decodable>(_ type: T.Type, from data: Data) -> Result<T, Error> {
        let decoder = JSONDecoder()
        
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            return .success(decodedObject)
        } catch {
            return .failure(error)
        }
    }
}
