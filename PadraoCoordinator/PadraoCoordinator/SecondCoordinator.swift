//
//  SecondCoordinator.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

protocol BackToFirstViewControllerDelegate: class{
  
  func navigateBackToFirstPage(novoCoordinator: SecondCoordinator)
}

class SecondCoordinator: Coordinator{
  
  
  var childCoordinators: [Coordinator] = []
  
  unowned let navigationController: UINavigationController
  
  weak var delegate: BackToFirstViewControllerDelegate?
  
  required init(navigationController: UINavigationController) {
    
    self.navigationController = navigationController
  }
  
  func start() {
    
    let secondViewController: SecondViewController = SecondViewController()
    secondViewController.delegate = self
    self.navigationController.pushViewController(secondViewController, animated: true)
    
  }
  
  
}
extension SecondCoordinator: SecondViewControllerDelegate{
  
  func navigationToFirstPage() {
    self.delegate?.navigateBackToFirstPage(novoCoordinator: self)
  }
  
  func navigationToThirdPage() {
    let thirdViewController: ThirdViewController = ThirdViewController()
    self.navigationController.pushViewController(thirdViewController, animated: true)
  }
  
  
}
