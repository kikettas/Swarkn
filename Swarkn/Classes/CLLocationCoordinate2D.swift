//
//  CLLocationCoordinate2D.swift
//  Pods
//
//  Created by Enrique del Pozo Gómez on 2/9/17.
//
//

import Foundation
import CoreLocation


extension CLLocationCoordinate2D {
    
    /**
     Initialize with a well-know-text representation, POINT(lat, long)
     
     - Parameter WKT: Location representation. i.e: POINT(40.123321, 3.123123)     
     */
    
    init?(WKT: String) {
        let WKTSeparationCharacters = CharacterSet(charactersIn: "() ")
        let WKTSeparated = WKT.components(separatedBy: WKTSeparationCharacters)
        
        if let lon = WKTSeparated[safe: 1], let lonD = Double(lon), let lat = WKTSeparated[safe: 2], let latD = Double(lat) {
            self = CLLocationCoordinate2D(latitude: latD, longitude: lonD)
        } else {
            return nil
        }
    }
}
