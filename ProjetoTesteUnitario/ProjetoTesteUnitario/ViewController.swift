//
//  ViewController.swift
//  ProjetoTesteUnitario
//
//  Created by Edmilson vieira da silva on 11/12/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var messagePresenter: MessagePresenter?
      
      override func viewDidLoad() {
          super.viewDidLoad()
          messagePresenter = AlertMessagePresenter()
      }
      
      func displayAlert() {
          messagePresenter?.presentMessage("Something happened!", on: self)
      }
  }
