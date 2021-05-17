//
//   BreachViewModel.swift
//  MVVMConceitoMaisBasico
//
//  Created by Edmilson vieira da silva on 07/03/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation


class BreachViewModel {
    // MARK: - Initialization
    init(model: [BreachModel]? = nil) {
        if let inputModel = model {
            breaches = inputModel
        }
    }
    
    var breaches = [BreachModel]()
    
    public func configure(_ view: BreachView) {
        view.titleLabel.text = breaches.first?.title
    }
    
}

extension BreachViewModel {
    func fetchBreaches(completion: @escaping (Result<[BreachModel], Error>) -> Void) {
        completion(.success(breaches))
    }
}
