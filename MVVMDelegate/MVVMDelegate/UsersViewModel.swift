//
//  UsersViewModel.swift
//  MVVMDelegate
//
//  Created by Edmilson vieira da silva on 13/02/21.
//  Copyright © 2021 Edmilson vieira da silva. All rights reserved.
//

import Foundation

protocol UsersViewModelType: ViewModelType {
    var sections: [(name: String, rows: [UserItemModel])]  { get }
}
//view model
class UsersViewModel: UsersViewModelType {

    weak var delegate: ViewModelDelegate?
    var sections: [(name: String, rows: [UserItemModel])] = []
    let dataSource: UsersDataSourceType

    init(dataSource: UsersDataSourceType) {
        self.dataSource = dataSource
    }

    func bootstrap() {
      //carega dados atraves do delegate,usa data sourceque carrega os dados que serao usados na view
        loadData()
    }

    private func loadData() {
        delegate?.willLoadData()
        dataSource.fetchUsers { [weak self] result in
            DispatchQueue.main.async {
                guard let ws = self else { return }
                switch result {
                case .failure(_):
                    ws.sections = []

                case .success(let users):
                    let sortedUserModels = users
                        .map({ UserItemModel(user: $0) })
                        .sorted(by: { $0.name < $1.name })

                    ws.sections.append(ws.section(with: sortedUserModels, start: "A", end: "I"))
                    ws.sections.append(ws.section(with: sortedUserModels, start: "J", end: "Q"))
                    ws.sections.append(ws.section(with: sortedUserModels, start: "R", end: "Z"))
                }
                ws.delegate?.didLoadData() // envio de dados a view
            }
        }
    }

    private func section(with users: [UserItemModel], start: Character, end: Character) -> (name: String, rows: [UserItemModel]) {
        let filteredUsers = users
            .filter({ !$0.name.isEmpty })
            .filter({
                $0.name.uppercased().first! >= start && $0.name.uppercased().first! <= end
            })
        return (name: "\(start) to \(end)",
                rows: filteredUsers)
    }

}
