//
//  EntryAddViewModel.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 30/03/22.
//

import UIKit

protocol EntryAddViewModelProtocol{
    
}

class EntryAddViewModel{

    var coordinator: MainCoordinatorProtocol
    
    init(coordinator: MainCoordinatorProtocol){
        self.coordinator = coordinator
    }
}

extension EntryAddViewModel: EntryAddViewModelProtocol{
    
}
