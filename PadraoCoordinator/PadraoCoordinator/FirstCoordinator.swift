//
//  FirstCoordinator.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator{
  
  var childCoordinators: [Coordinator] = []
  
  unowned let navigationController: UINavigationController
  
  required init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let firstviewController: FirstViewController = FirstViewController()
    
    firstviewController.delegate = self
    self.navigationController.viewControllers = [firstviewController]
  }
  
  
}
extension FirstCoordinator: FirstViewControllerDelegate{
  
  func navigationToNextage() {
    let secondCoordinator = SecondCoordinator(navigationController: navigationController)
    childCoordinators.append(secondCoordinator)
    secondCoordinator.start()
  }
}
extension FirstCoordinator: BackToFirstViewControllerDelegate{
  func navigateBackToFirstPage(novoCoordinator: SecondCoordinator) {
  //  let firstviewController: FirstViewController = FirstViewController()
    navigationController.popToRootViewController(animated:  true)
    childCoordinators.removeLast()
  }
  
  
}
