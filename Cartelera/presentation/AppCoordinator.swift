//  
//  AppCoordinator.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import UIKit

protocol Coordinator {
    func resolve()
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
            
    var navigationController: UINavigationController?
    var window: UIWindow
    let appDependencies: AppDependenciesProtocol
    
    // MARK: - Init
    
    init(_ window: UIWindow, appDependencies: AppDependenciesProtocol = AppDependencies()) {
        self.window = window
        self.appDependencies = appDependencies
    }
    
    // MARK: - Coordinator
    
    func resolve() {
        let viewController = appDependencies.makeFilmsListView(navigationDelegate: self)
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController?.modalPresentationStyle = .fullScreen
        window.rootViewController = navigationController
    }
        
}

// MARK: - FilmsListNavigationDelegate

extension AppCoordinator: FilmsListNavigationDelegate {
    func navigate(to: FilmsListNavigation) {
        
    }
}
