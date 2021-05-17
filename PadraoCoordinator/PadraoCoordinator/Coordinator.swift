//
//  Coordinator.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit


protocol Coordinator : class {
  
  var childCoordinators : [Coordinator] {get set}
  
  init(navigationController: UINavigationController)
  
  func  start()
  
}
