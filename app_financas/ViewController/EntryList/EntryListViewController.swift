//
//  EntryListViewController.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 24/03/22.
//

import UIKit

class EntryListViewController: UIViewController {
    var viewModel: EntryListViewModelProtocol
    
    let entryListView: EntryListView = {
        let entryListView = EntryListView()
        entryListView.translatesAutoresizingMaskIntoConstraints = false
        return entryListView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColorApp
        setEntryListView()
    }
    init(viewModel: EntryListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setEntryListView(){
        self.view.addSubview(entryListView)
        entryListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        entryListView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        entryListView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        entryListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
