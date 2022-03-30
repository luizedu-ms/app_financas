//
//  MainCoordinator.swift
//  app_financas
//
//  Created by Luiz Mendes Silva on 24/03/22.
//

import UIKit

protocol Coordinator{
    var navigationController: UINavigationController {get set}
    func start()
}

protocol MainCoordinatorProtocol{
    func continueToAddEntry()
    func continueToAddCategory()
}

class  MainCoordinator: Coordinator {
    let tabbar = UITabBarController()
    let tabbarAppearence = UITabBarAppearance()
    
    var navigationController: UINavigationController
    
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
         
         navigationController.navigationBar.isHidden = true

         
    }
    func start(){
    
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(continueToAddEntry))
        
        let entrylistVM = EntryListViewModel(coordinator: self)
        let entrylistVC = EntryListViewController(viewModel: entrylistVM)
        
        
        let categoryListVM = CategoryListViewModel(coordinator: self)
        let categoryListVC = CategoryListViewController(viewModel: categoryListVM)
        
        let navEntrylistVC = UINavigationController(rootViewController: entrylistVC)
        let navCategoryListVC = UINavigationController(rootViewController: categoryListVC)
        
        entrylistVC.navigationItem.rightBarButtonItem = add
        entrylistVC.navigationItem.title = "Meus gastos"
        entrylistVC.navigationController?.navigationBar.prefersLargeTitles = true
    
        categoryListVC.navigationItem.rightBarButtonItem = add
        categoryListVC.navigationItem.title = "Categorias"
        categoryListVC.navigationController?.navigationBar.prefersLargeTitles = true
        
        tabbar.viewControllers = [navEntrylistVC,navCategoryListVC]
        guard let items = tabbar.tabBar.items else  {return}
        let icons = ["banknote", "list.bullet"]
        let label = ["Lancamento", "Categorias"]
        for x in 0..<icons.count {
            items[x].image = UIImage(systemName: icons[x])
            items[x].title = label[x]
        }
        navigationController.pushViewController(tabbar, animated: false)
    }
}
extension MainCoordinator: MainCoordinatorProtocol{
    @objc func continueToAddEntry() {
        let entryAddVM = EntryAddViewModel(coordinator: self)
        let entryAddVC = EntryAddViewController(viewModel: entryAddVM)
        
        let navEntryAddVC = UINavigationController(rootViewController: entryAddVC)
        entryAddVC.navigationController?.navigationBar.prefersLargeTitles = true
        entryAddVC.navigationItem.title = "Adicionar Lançamentos"
        
        navigationController.present(navEntryAddVC, animated: true)
    }
    
    func continueToAddCategory() {
        let viewController = ViewController()
        navigationController.present(viewController, animated: true)
    }
}
