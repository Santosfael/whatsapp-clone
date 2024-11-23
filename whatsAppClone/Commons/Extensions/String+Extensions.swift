//
//  String+Extensions.swift
//  whatsAppClone
//
//  Created by Rafael on 22/11/24.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
