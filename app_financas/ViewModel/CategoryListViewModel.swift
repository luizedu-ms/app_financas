//
//  CategoryListViewModel.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 29/03/22.
//

import Foundation


protocol CategoryListViewModelProtocol{
   
}
class CategoryListViewModel {
    var coordinator: MainCoordinatorProtocol
    
    init(coordinator: MainCoordinatorProtocol){
        self.coordinator = coordinator
    }
}
extension CategoryListViewModel:CategoryListViewModelProtocol{
//    func didTapButton() {
//        self.coordinator.continueToAddEntry()
//    }
}
