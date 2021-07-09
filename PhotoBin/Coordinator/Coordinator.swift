//
//  Coordinator.swift
//  PhotoBin
//
//  Created by Vipin Aggarwal on 10/05/20.
//  Copyright © 2020 Vipin Aggarwal. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
