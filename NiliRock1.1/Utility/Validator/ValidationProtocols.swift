//
//  ValidationProtocols.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation


protocol ValidationProtocol {
    static func isEmptyEmail(email: String?) -> ValidationErrors?
    static func isValidEmail(email: String?) -> ValidationErrors?
    static func isEmptyPassword(password: String?) ->  ValidationErrors?

}
