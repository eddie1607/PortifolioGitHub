//
//  BreachesViewController.swift
//  MVVMConceitoMaisBasico
//
//  Created by Edmilson vieira da silva on 07/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

class BreachesViewController: UIViewController {
       
    // the view model is setup with simple
    var breachesViewModel = BreachViewModel(model: [BreachModel(title: "000webhost")])

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .cyan
        let breachView = BreachView(frame: self.view.frame)
        breachesViewModel.configure(breachView)
        self.view.addSubview(breachView)
        breachView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            breachView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            breachView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            breachView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            breachView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
}
