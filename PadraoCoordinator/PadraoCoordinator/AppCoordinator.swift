//
//  AppCoordinator.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit



class AppCoordinator: Coordinator{
  
  var childCoordinators: [Coordinator] = []
  
  unowned let navigationController:UINavigationController
  
  required init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let firstviewController: ViewController = ViewController()
    
    
  }
  
  
}
/*
class AppCoordinator {
  
  var rootController: UINavigationController
  let initialViewController: UIViewController
  
  init(withRootController: UINavigationController){
    self.rootController = withRootController
    initialViewController =  secondViewController()
  }
}
extension AppCoordinator: Coordinator{
  
  func start() {
    rootController.pushViewController(initialViewController, animated: false)
  }
  
  
  
}
*/
