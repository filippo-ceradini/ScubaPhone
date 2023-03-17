//
//  File.swift
//  ScubaPhone
//
//  Created by Filippo on 17/03/23.
//

import Foundation

import UIKit
import CoreLocation

class loggedDive:Identifiable {

    var id: String = ""
    var startTime: Date
    var gpsLocation: CLLocation? = nil
    var maxDepth: Float
    var waterTemp: Float
    var endTime: Date
    
    init(id: String = "", startTime: Date, gpsLocation: CLLocation, depth: Float, waterTemp: Float, endTime: Date) {
        self.id = id
        self.startTime = startTime
        self.gpsLocation = gpsLocation
        self.maxDepth = depth
        self.waterTemp = waterTemp
        self.endTime = endTime
    }
}
