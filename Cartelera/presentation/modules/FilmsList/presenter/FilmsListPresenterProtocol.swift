//  
//  FilmsListPresenterProtocol.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import UIKit

// MARK: - ViewState

enum FilmsListNavigation {
    
}

protocol FilmsListNavigationDelegate: AnyObject {
    func navigate(to: FilmsListNavigation)
}

protocol FilmsListPresenterProtocol where Self: BasePresenter {
    
    var viewDelegate: FilmsListPresenterDelegate? { get set }
    
    var viewModel: FilmsListViewController.Model? { get set }
    
}

protocol FilmsListPresenterDelegate: BasePresenterDelegate {
    
}
