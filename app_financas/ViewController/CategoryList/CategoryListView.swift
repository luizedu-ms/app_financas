//
//  CategoryListView.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 29/03/22.
//

import UIKit

class CategoryListView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListCategoryTableViewCell.self, forCellReuseIdentifier: ListCategoryTableViewCell.identifier)
        tableView.backgroundColor = .whiteColorApp
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        setTableView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView(){
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension CategoryListView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCategoryTableViewCell.identifier) as! ListCategoryTableViewCell
        return cell
    }
}
extension CategoryListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _,_, indexPath in
            print("delete press")
        }
        deleteAction.backgroundColor = .darkGreenApp
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipe
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .destructive, title: "Editar") { _,_, indexPath in
            print("edit press")
        }
        editAction.backgroundColor = .darkGreenApp
        let swipe = UISwipeActionsConfiguration(actions: [editAction])
        return swipe
    }

}
