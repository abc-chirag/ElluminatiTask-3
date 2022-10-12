//
//  Double+Extension.swift
//  Sunil Zalavadiya
//
//  Created by Sunil Zalavadiya on 08/07/20.
//  Copyright © 2020 Sunil Zalavadiya. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
