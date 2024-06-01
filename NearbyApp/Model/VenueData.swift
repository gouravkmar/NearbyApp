//
//  VenueData.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation


import Foundation

class VenueData: Codable {
    let venues: [Venue]
    let meta: Meta
    
    init(venues: [Venue], meta: Meta) {
        self.venues = venues
        self.meta = meta
    }
}

class Venue: Codable {
    let state: String?
    let nameV2: String
    let postalCode: String
    let name: String
    let links: [String]
    let timezone: String?
    let url: String
    let score: Int
    let location: Location
    let address: String?
    let country: String
    let hasUpcomingEvents: Bool
    let numUpcomingEvents: Int
    let city: String
    let slug: String
    let extendedAddress: String
    let stats: Stats
    let id: Int
    let popularity: Int
    let accessMethod: String?
    let metroCode: Int?
    let capacity: Int
    let displayLocation: String
    
    enum CodingKeys: String, CodingKey {
        case state
        case nameV2 = "name_v2"
        case postalCode = "postal_code"
        case name
        case links
        case timezone
        case url
        case score
        case location
        case address
        case country
        case hasUpcomingEvents = "has_upcoming_events"
        case numUpcomingEvents = "num_upcoming_events"
        case city
        case slug
        case extendedAddress = "extended_address"
        case stats
        case id
        case popularity
        case accessMethod = "access_method"
        case metroCode = "metro_code"
        case capacity
        case displayLocation = "display_location"
    }
    
    init(state: String?, nameV2: String, postalCode: String, name: String, links: [String], timezone: String?, url: String, score: Int, location: Location, address: String?, country: String, hasUpcomingEvents: Bool, numUpcomingEvents: Int, city: String, slug: String, extendedAddress: String, stats: Stats, id: Int, popularity: Int, accessMethod: String?, metroCode: Int?, capacity: Int, displayLocation: String) {
        self.state = state
        self.nameV2 = nameV2
        self.postalCode = postalCode
        self.name = name
        self.links = links
        self.timezone = timezone
        self.url = url
        self.score = score
        self.location = location
        self.address = address
        self.country = country
        self.hasUpcomingEvents = hasUpcomingEvents
        self.numUpcomingEvents = numUpcomingEvents
        self.city = city
        self.slug = slug
        self.extendedAddress = extendedAddress
        self.stats = stats
        self.id = id
        self.popularity = popularity
        self.accessMethod = accessMethod
        self.metroCode = metroCode
        self.capacity = capacity
        self.displayLocation = displayLocation
    }
}

class Location: Codable {
    let lat: Double
    let lon: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}

class Stats: Codable {
    let eventCount: Int
    
    enum CodingKeys: String, CodingKey {
        case eventCount = "event_count"
    }
    
    init(eventCount: Int) {
        self.eventCount = eventCount
    }
}

class Meta: Codable {
    let total: Int
    let took: Int
    let page: Int
    let perPage: Int
    let geolocation: Geolocation
    
    enum CodingKeys: String, CodingKey {
        case total
        case took
        case page
        case perPage = "per_page"
        case geolocation
    }
    
    init(total: Int, took: Int, page: Int, perPage: Int, geolocation: Geolocation) {
        self.total = total
        self.took = took
        self.page = page
        self.perPage = perPage
        self.geolocation = geolocation
    }
}

class Geolocation: Codable {
    let lat: Double
    let lon: Double
    let city: String
    let state: String
    let country: String
    let postalCode: String
    let displayName: String
    let metroCode: Int?
    let range: String
    
    init(lat: Double, lon: Double, city: String, state: String, country: String, postalCode: String, displayName: String, metroCode: Int?, range: String) {
        self.lat = lat
        self.lon = lon
        self.city = city
        self.state = state
        self.country = country
        self.postalCode = postalCode
        self.displayName = displayName
        self.metroCode = metroCode
        self.range = range
    }
}
