//
//  AppDataManager.swift
//  NearbyApp
//
//  Created by Gourav Kumar on 01/06/24.
//

import Foundation
import CoreLocation

let entitiesPerPage = 10

enum DatafetchStatus {
    case fetchingLocation
    case fetchedLocation
    case failedToFetchLocation
    case fetchingVenues
    case fetchedVenues
    case failedTofetchVenues
}
enum UserDataSetStatus {
    case userDataSuccess
    case userDataFailure
}
protocol DataProtocol {
    func didUpdateDataStatus(status : DatafetchStatus)
}
class AppDataManager {
    var range : String = "10" {didSet {
        setAppData()
    }}
    var statusDelegate : DataProtocol?
    static let shared = AppDataManager()
    var userData : UserData
    var venueData : VenueData?
    private var locationManager: LocationManager
    private var networkManager: NetworkManager
    
    private init() {
        self.locationManager = LocationManager.shared
        self.networkManager = NetworkManager.shared
        userData = UserData(perPage: 10, page: 1)
        setAppData()
    }
    func setAppData(){
        setUserData(completion: {status in
            if status == .userDataSuccess {
                self.setVenueData()
            }
        })
    }
    
    func setUserData(completion : (UserDataSetStatus)->Void){
        setLocation(completion: { status in
            if status == .success {
                self.statusDelegate?.didUpdateDataStatus(status: .fetchedLocation)
                setSearchRange(range: range)
                completion(.userDataFailure)
            }else {
                self.statusDelegate?.didUpdateDataStatus(status: .failedToFetchLocation)
                completion(.userDataFailure)
            }
        })
    }
    func setVenueData(){
        if let url = URLHandler.createURLFromUserData(data: userData){
            statusDelegate?.didUpdateDataStatus(status: .fetchingVenues)
            networkManager.fetchData(from: url, completion: { result in
                switch result {
                case .success(let data):
                    let parseResult: Result<VenueData, Error> = ResponseHandler.parse(VenueData.self, from: data)
                    switch parseResult {
                    case .success(let venueData):
                        print(venueData)
                        self.venueData = venueData
                        self.statusDelegate?.didUpdateDataStatus(status: .fetchedLocation)
                    case .failure(let error):
                        self.statusDelegate?.didUpdateDataStatus(status: .failedTofetchVenues)
                        print("Parsing failed: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    self.statusDelegate?.didUpdateDataStatus(status: .failedTofetchVenues)
                    print("Fetching data failed: \(error.localizedDescription)")
                }
            })
        }else {
            statusDelegate?.didUpdateDataStatus(status: .failedTofetchVenues)
        }
    }
    func setSearchRange(range : String){
        self.range = range
        userData.setRange(range)
    }
    
    func setLocation(completion : (locationFetchStatus) -> Void ){
        statusDelegate?.didUpdateDataStatus(status: .fetchingLocation)
        locationManager.requestLocation(completion: { location , error  in
            if error == nil , let location = location  {
                self.userData.setLatitude(location.coordinate.latitude)
                self.userData.setLongitude(location.coordinate.longitude)
            }
        })
    }
}
