//
//  OutcomeView.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 25/03/22.
//

import UIKit

class OutcomeView: UIView {        
        lazy var iconIncome: UIImageView = {
            lazy var iconIncome = UIImageView()
            iconIncome.translatesAutoresizingMaskIntoConstraints = false
            iconIncome.image = UIImage(systemName: "arrow.up.circle.fill")
            iconIncome.tintColor = .black
            iconIncome.contentMode = .scaleAspectFill
            return iconIncome
        }()
        lazy var valueLabel: UILabel = {
            lazy var valueLabel = UILabel()
            valueLabel.translatesAutoresizingMaskIntoConstraints = false
            valueLabel.text = "R$ 180,00"
            valueLabel.textColor = .textColorApp
    //        valueLabel.font = UIFont(name: "Roboto", size: 26)
            valueLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
            return valueLabel
        }()
        lazy var infoLabel: UILabel = {
            lazy var infoLabel = UILabel()
            infoLabel.translatesAutoresizingMaskIntoConstraints = false
            infoLabel.text = "Saídas esse mes"
            infoLabel.textColor = UIColor(red: 0.333, green: 0.333, blue: 0.333, alpha: 1)
            infoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            return infoLabel
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            loudElements()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func loudElements(){
            setIconIncome()
            setValueLabel()
            setInfoLabel()
        }
        
        private func setIconIncome(){
            self.addSubview(iconIncome)
            iconIncome.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
            iconIncome.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 12).isActive = true
            iconIncome.widthAnchor.constraint(equalToConstant: 32).isActive = true
            iconIncome.heightAnchor.constraint(equalToConstant: 32).isActive = true
        }
        private func setValueLabel(){
            self.addSubview(valueLabel)
            valueLabel.topAnchor.constraint(equalTo: iconIncome.bottomAnchor, constant: 12).isActive = true
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 12).isActive = true
        }
        private func setInfoLabel(){
            self.addSubview(infoLabel)
            infoLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 1).isActive = true
            infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 12).isActive = true
        }

    }
