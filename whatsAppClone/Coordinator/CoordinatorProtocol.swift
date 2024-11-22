//
//  CoordinatorProtocol.swift
//  whatsAppClone
//
//  Created by Rafael on 11/11/24.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start()
}
