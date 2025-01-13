//
//  FontSizeAndSpacing.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 25/01/24.
//

import Foundation

// MARK: Font
enum fontName : String {
    case N_BoldBornStrong       = "Time Roman Bold"
    case N_SemiBoldBornStrong   = "Times-SemiBold"
    case N_RegularBornStrong    = "Times" //"Times-Roman Regular"
    case N_BornStrongLight      = "times"
}
struct FontSize {
    static let size1 = 12.0
    static let size2 = 14.0
    static let size3 = 16.0
    static let size4 = 20.0
    static let size5 = 24.0
    static let size6 = 32.0
    static let size7 = 50.0
}

struct Radius {
    static let radius1 = 10.0
    static let radius2 = 20.0
    static let radius3 = 30.0
    static let radius4 = 40.0
    static let radius5 = 50.0  //using in textfield corner radius
}
