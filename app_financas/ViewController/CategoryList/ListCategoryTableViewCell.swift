//
//  ListCategoryTableViewCell.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 29/03/22.
//

import UIKit

class ListCategoryTableViewCell: UITableViewCell {
        
    static let identifier = "ListCategoryTableViewCell"
    
    lazy var entryLabel: UILabel = {
        lazy var entryLabel = UILabel()
        entryLabel.translatesAutoresizingMaskIntoConstraints = false
        entryLabel.text = "Contas Fixas"
        entryLabel.textColor = .textColorApp
//        valueLabel.font = UIFont(name: "Roboto", size: 26)
        entryLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return entryLabel
    }()
    lazy var categoryLabel: UILabel = {
        lazy var categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.text = "Descrição da categoria..."
        categoryLabel.textColor = .textColorApp
        categoryLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return categoryLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loudElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loudElements(){
        setEntryLabel()
        setCategoryLabel()
    }
    private func setEntryLabel(){
        self.addSubview(entryLabel)
        entryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        entryLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16).isActive = true
    }
    private func setCategoryLabel(){
        self.addSubview(categoryLabel)
        categoryLabel.topAnchor.constraint(equalTo: entryLabel.bottomAnchor, constant: 0).isActive = true
        categoryLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 16).isActive = true
    }

}
