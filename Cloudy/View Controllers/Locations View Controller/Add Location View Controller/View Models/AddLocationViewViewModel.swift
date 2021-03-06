//
//  AddLocationViewViewModel.swift
//  Cloudy
//
//  Created by Tanin on 27/04/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import RxSwift
import RxCocoa
import Foundation

class AddLocationViewViewModel {
    
    var hasLocations: Bool { return numberOfLocations > 0 }
    var numberOfLocations: Int { return _locations.value.count }
    
    // BehaviorRelay is read-write stream, we keep it private as we don't want the VC to make changes to these streams
    private let _locations = BehaviorRelay<[Location]>(value: []) // a stream which has [Location] flow through it
    private let _querying = BehaviorRelay<Bool>(value: false) // a stream which as Bool flows through it
    
    // We expose 'locations' and 'querying' Driver instances to VC
    var locations: Driver<[Location]> { return _locations.asDriver() }
    var querying: Driver<Bool> { return _querying.asDriver() }
    
    // MARK: -
    
    private let locationService: LocationService
    
    private let disposeBag = DisposeBag()
    
    init(query: Driver<String>, locationService: LocationService){ // Driver is read-only stream
        self.locationService = locationService
        
        query
            .throttle(0.5) // limit the number of request that are sent in a period of time
            .distinctUntilChanged()  // to prevent sending the request with the same query
            .drive(onNext: { [weak self] (addressString) in // call when new request is emitted from the sequence
                self?.geocoder(addressString: addressString)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Methods
    
    func location(at index: Int) -> Location? {
        guard index < _locations.value.count else { return nil }
        return _locations.value[index]
    }
    
    func viewModelForLocation(at index: Int) -> LocationRepresentable? {
        guard let location = location(at: index) else {return nil}
        return LocationsViewLocationViewModel(location: location.location, locationAsString: location.name)
    }
    
    private func geocoder(addressString: String?) {
        guard let addressString = addressString, !addressString.isEmpty else {
            _locations.accept([])
            return
        }
        
        _querying.accept(true)
        
        // Geocode Address String
        locationService.geocode(addressString: addressString) { [weak self] (locations, error) in
            self?._querying.accept(false)
            self?._locations.accept(locations)
            
            if let error = error {
                print("Unable to Forward Geocode Address (\(error)")
            }
        }
        
    }
    
}
