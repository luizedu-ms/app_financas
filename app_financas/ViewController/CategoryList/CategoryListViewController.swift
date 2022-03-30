//
//  CategoryListViewController.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 29/03/22.
//

import UIKit

class CategoryListViewController: UIViewController {
    var viewModel: CategoryListViewModelProtocol
    
    let categoryListView: CategoryListView = {
        let categoryListView = CategoryListView()
        categoryListView.translatesAutoresizingMaskIntoConstraints = false
        return categoryListView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColorApp
        setCategoryListView()
    }
    init(viewModel: CategoryListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCategoryListView(){
        self.view.addSubview(categoryListView)
        categoryListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        categoryListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        categoryListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoryListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
