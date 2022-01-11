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
    
    // MARK: - Init
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Coordinator
    
    func resolve() {
        let viewController = ViewController()
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController?.modalPresentationStyle = .fullScreen
        window.rootViewController = navigationController
    }
        
}
