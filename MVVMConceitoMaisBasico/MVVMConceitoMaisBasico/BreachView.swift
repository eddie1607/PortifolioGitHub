//
//  BreachView.swift
//  MVVMConceitoMaisBasico
//
//  Created by Edmilson vieira da silva on 07/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import UIKit

public class BreachView: UIView {
    
    public let titleLabel: UILabel
    public override init(frame: CGRect) {
        let titleFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        titleLabel = UILabel(frame: titleFrame)
        titleLabel.textAlignment = .center
        super.init(frame: frame)
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
