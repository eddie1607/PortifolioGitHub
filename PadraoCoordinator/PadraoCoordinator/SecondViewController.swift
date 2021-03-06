//
//  SecondViewController.swift
//  PadraoCoordinator
//
//  Created by Edmilson vieira da silva on 04/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class{
  func navigationToFirstPage()
  func navigationToThirdPage()
  
}

class SecondViewController: UIViewController {
  
  weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
      title = "SecondViewController ...2"
      let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(navigateBackToFirstPage(_:)))
      self.navigationItem.leftBarButtonItem = backButton
setupUI()        // Do any additional setup after loading the view.
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
    button.addTarget(self, action: #selector(navigateGoToThirdPage), for: .touchUpInside)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
   }()

     // MARK: - Actions
     @objc func navigateGoToThirdPage(_ sender: UIButton) {
        // coordinator?.coordinateToTabBar()
      self.delegate?.navigationToThirdPage()
     }
  
  @objc func navigateBackToFirstPage(_ sender: UIButton) {
     // coordinator?.coordinateToTabBar()
    self.delegate?.navigationToFirstPage()
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SecondViewController {
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

