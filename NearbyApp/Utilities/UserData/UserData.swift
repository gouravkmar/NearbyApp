//
//  UserData.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation

import Foundation
import CoreLocation

class UserData : Codable {
    private var clientId: String = UUID().uuidString
    private var perPage: Int
    private var page: Int
    private var latitude: Double?
    private var longitude: Double?
    private var range: String?
    private var query: String?
    
    init(perPage: Int, page: Int) {
        self.perPage = perPage
        self.page = page
    }
    
    // MARK: - Getters
    
    func getClientId() -> String {
        return clientId
    }
    
    func getPerPage() -> Int {
        return perPage
    }
    
    func getPage() -> Int {
        return page
    }
    
    func getLatitude() -> Double? {
        return latitude
    }
    
    func getLongitude() -> Double? {
        return longitude
    }
    
    func getRange() -> String? {
        return range
    }
    
    func getQuery() -> String? {
        return query
    }
    
    // MARK: - Setters
    
    func setPerPage(_ perPage: Int) {
        self.perPage = perPage
    }
    
    func setPage(_ page: Int) {
        self.page = page
    }
    
    func setLatitude(_ latitude: Double) {
        self.latitude = latitude
    }
    
    func setLongitude(_ longitude: Double) {
        self.longitude = longitude
    }
    
    func setRange(_ range: String) {
        self.range = range
    }
    
    func setQuery(_ query: String) {
        self.query = query
    }
}
