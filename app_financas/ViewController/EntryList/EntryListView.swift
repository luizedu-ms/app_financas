//
//  EntryListView.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 25/03/22.
//

import UIKit

class EntryListView: UIView {

    lazy var segmentControl: UISegmentedControl = {
        let items = ["Essa Semana","Esse mes","Todos"]
        lazy var segControl = UISegmentedControl(items:items)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.backgroundColor = UIColor(red: 118, green: 118, blue: 128, alpha: 0.12)
        segControl.selectedSegmentIndex = 1
        return segControl
    }()
    
    lazy var incomeView: IncomeView = {
        lazy var incomeView = IncomeView()
        incomeView.translatesAutoresizingMaskIntoConstraints = false
        incomeView.backgroundColor = .incomeApp
        incomeView.layer.cornerRadius = 10
        return incomeView
    }()

    lazy var outcomeView: OutcomeView = {
        lazy var outcomeView = OutcomeView()
        outcomeView.translatesAutoresizingMaskIntoConstraints = false
        outcomeView.backgroundColor = .outIncomeApp
        outcomeView.layer.cornerRadius = 10
        return outcomeView
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ListEntryTableViewCell.self, forCellReuseIdentifier: ListEntryTableViewCell.identifier)
        tableView.backgroundColor = .whiteColorApp
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        loudElements()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loudElements(){
        setSegmentControl()
        setupIncomeView()
        setupoutcomeView()
        setTableView()
    }
    
    private func setSegmentControl(){
        self.addSubview(segmentControl)
        segmentControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        segmentControl.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16).isActive = true
        segmentControl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16).isActive = true
    }
    private func setupIncomeView(){
        self.addSubview(incomeView)
        incomeView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20).isActive = true
        incomeView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16).isActive = true
        incomeView.heightAnchor.constraint(equalToConstant: 124).isActive = true
        incomeView.widthAnchor.constraint(equalToConstant: 171).isActive = true
    }
    private func setupoutcomeView(){
        self.addSubview(outcomeView)
        outcomeView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20).isActive = true
        outcomeView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16).isActive = true
        outcomeView.heightAnchor.constraint(equalToConstant: 124).isActive = true
        outcomeView.widthAnchor.constraint(equalToConstant: 171).isActive = true
    }
    private func setTableView(){
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: outcomeView.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension EntryListView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListEntryTableViewCell.identifier) as! ListEntryTableViewCell
        return cell
    }
}
extension EntryListView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.textLabel?.text = "Lancamentos"
        header?.textLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        header?.textLabel?.textColor = .textColorApp
        
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
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

