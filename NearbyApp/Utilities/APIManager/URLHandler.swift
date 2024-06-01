//
//  URLHandler.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation

let baseUrlString = "https://api.seatgeek.com/2/venues"
class URLHandler {
    
    static func createURLFromUserData(data : UserData)->URL?{
        let querryItems = createQuerryItemFromUserData(data: data)
        return createURL(querryItems: querryItems)
    }
    static func createQuerryItemFromUserData(data : UserData) -> [URLQueryItem]{
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "client_id", value: data.getClientId()))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(data.getPerPage())"))
        queryItems.append(URLQueryItem(name: "page", value: "\(data.getPage())"))
        if let lat = data.getLatitude(), let lon = data.getLongitude() {
            queryItems.append(URLQueryItem(name: "lat", value: "\(lat)"))
            queryItems.append(URLQueryItem(name: "lon", value: "\(lon)"))
        }
        if let range = data.getRange() {
            queryItems.append(URLQueryItem(name: "range", value: range))
        }
        if let query = data.getQuery() {
            queryItems.append(URLQueryItem(name: "q", value: query))
        }
        return queryItems
    }
    static func createURL(querryItems: [URLQueryItem])->URL?{
        var urlComponents = URLComponents(string: baseUrlString)
        urlComponents?.queryItems = querryItems
        return urlComponents?.url
        
    }
}
