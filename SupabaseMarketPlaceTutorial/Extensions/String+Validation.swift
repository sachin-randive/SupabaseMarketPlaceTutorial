//
//  String+Validation.swift
//  SupabaseMarketPlaceTutorial
//
//  Created by Sachin Randive on 17/03/26.
//

import Foundation

extension String {
    func isValidEmail () -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
