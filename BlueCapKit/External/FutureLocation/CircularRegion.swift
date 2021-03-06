//
//  CircularRegion.swift
//  BlueCap
//
//  Created by Troy Stribling on 10/6/14.
//  Copyright (c) 2014 Troy Stribling. The MIT License (MIT).
//

import Foundation
import CoreLocation

public class CircularRegion : Region {

    internal let clCircularRegion : CLCircularRegion
    
    public override class func isMonitoringAvailableForClass() -> Bool {
        return CLLocationManager.isMonitoringAvailableForClass(CLCircularRegion)
    }
    
    public var center : CLLocationCoordinate2D {
        return self.clCircularRegion.center
    }

    public var radius : CLLocationDistance {
        return self.clCircularRegion.radius
    }

    internal init(region:CLCircularRegion, capacity:Int? = nil) {
        self.clCircularRegion = region
        super.init(region:region, capacity:capacity)
    }

    public convenience init(center:CLLocationCoordinate2D, radius:CLLocationDistance, identifier:String, capacity:Int? = nil) {
        let circularRegion = CLCircularRegion(center:center, radius:radius, identifier:identifier)
        self.init(region:circularRegion, capacity:capacity)
    }
    
    public convenience init(center:CLLocationCoordinate2D, identifier:String, capacity:Int? = nil) {
        let circularRegion = CLCircularRegion(center:center, radius:DEFAULT_REGION_RADIUS, identifier:identifier)
        self.init(region:circularRegion, capacity:capacity)
    }
    
    public func containsCoordinate(coordinate:CLLocationCoordinate2D) -> Bool {
        return self.clCircularRegion.containsCoordinate(coordinate)
    }
    
}