//
//  NationalParkLocation.swift
//  Africa
//
//  Created by Alexander Rojas Benavides on 9/28/21.
//

import Foundation
import MapKit
struct NationalParkLocation: Identifiable,Codable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed porperties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
