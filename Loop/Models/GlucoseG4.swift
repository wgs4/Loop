//
//  GlucoseG4.swift
//  Loop
//
//  Created by Mark Wilson on 7/21/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation
import G4ShareSpy
import HealthKit
import LoopKit


extension GlucoseG4: GlucoseValue {
    public var quantity: HKQuantity {
        return HKQuantity(unit: HKUnit.milligramsPerDeciliterUnit(), doubleValue: Double(glucose))
    }

    public var startDate: Date {
        return time
    }
}


extension GlucoseG4: SensorDisplayable {
    var isStateValid: Bool {
        return glucose >= 20
    }

    var stateDescription: String {
        if isStateValid {
            return NSLocalizedString("OK", comment: "Sensor state description for the valid state")
        } else {
            return NSLocalizedString("Needs Attention", comment: "Sensor state description for the non-valid state")
        }
    }

    var trendType: GlucoseTrend? {
        return GlucoseTrend(rawValue: Int(trend))
    }

    var isLocal: Bool {
        return true
    }
}
