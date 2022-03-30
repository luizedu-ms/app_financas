//
//  EntryListViewModel.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 24/03/22.
//

import Foundation

protocol EntryListViewModelProtocol{
   
}
class EntryListViewModel {
    var coordinator: MainCoordinatorProtocol
    
    init(coordinator: MainCoordinatorProtocol){
        self.coordinator = coordinator
    }  
}
extension EntryListViewModel:EntryListViewModelProtocol{
//    func didTapButton() {
//        self.coordinator.continueToAddEntry()
//    }
}
