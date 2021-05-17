//
//  FirstViewController.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

public protocol FirstViewControllerDelegate:class{
  func navigationToNextage()
}

class FirstViewController: UIViewController {
  
  weak var delegate: FirstViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "FirstViewController....1"
      view.backgroundColor = .darkGray
      setupUI()

        // Do any additional setup after loading the view.
    }
  
  let startButton: UIButton = {
      let button = UIButton()
      button.setTitle("Start!", for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = UIColor.systemBlue
      button.layer.cornerRadius = 10
      button.layer.shadowRadius = 5
      button.layer.shadowColor = UIColor.systemTeal.cgColor
      button.layer.shadowOpacity = 1.0
      button.layer.shadowOffset = CGSize(width: -1, height: 3)
      button.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()

    // MARK: - Actions
    @objc func startTapped(_ sender: UIButton) {
       // coordinator?.coordinateToTabBar()
      self.delegate?.navigationToNextage()
    }

}
extension FirstViewController {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.view.backgroundColor = .white
        self.view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            startButton.widthAnchor
                .constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            startButton.heightAnchor
                .constraint(equalToConstant: 50),
            startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
