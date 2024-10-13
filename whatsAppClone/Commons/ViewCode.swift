//
//  ViewCode.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import Foundation

protocol ViewCode {
    func buildHierachy()
    func setupConstrants()
    func applyAdditionalChanges()
}

extension ViewCode {
    func setupView() {
        buildHierachy()
        setupConstrants()
        applyAdditionalChanges()
    }
}
