//
//  LocationManager.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation

import CoreLocation
enum locationFetchStatus {
    case success
    case failure
}
class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager
    private var currentLocation: CLLocation?
    private var authorizationStatus: CLAuthorizationStatus
    private var completion: ((CLLocation?, Error?) -> Void)?
    
    private override init() {
        locationManager = CLLocationManager()
        authorizationStatus = CLLocationManager.authorizationStatus()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation(completion: @escaping (CLLocation?, Error?) -> Void) {
        self.completion = completion
        
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locationManager.requestLocation()
        } else {
            completion(nil, NSError(domain: "com.example.location", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location access not authorized"]))
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location
        completion?(location, nil)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.requestLocation()
        } else if status != .notDetermined {
            completion?(nil, NSError(domain: "com.example.location", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location access not authorized"]))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(nil, error)
    }
    
//    func locationUpdated(status : locationFetchStatus){
//        if status == .success {
//            
//        }else {
//            
//        }
//        
//        
//    }
}
