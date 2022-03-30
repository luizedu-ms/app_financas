//
//  EntryAddViewController.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 30/03/22.
//

import UIKit

class EntryAddViewController: UIViewController {
    var viewModel: EntryAddViewModelProtocol
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
    }
    init(viewModel: EntryAddViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
