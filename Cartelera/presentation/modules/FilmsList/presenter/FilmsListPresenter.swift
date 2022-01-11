//  
//  FilmsListPresenter.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import UIKit

class FilmsListPresenter: BasePresenter, FilmsListPresenterProtocol {
    
    // MARK: - Properties
    
    private weak var navigationDelegate: FilmsListNavigationDelegate?
    
    weak var viewDelegate: FilmsListPresenterDelegate?
    
    var viewModel: FilmsListViewController.Model?
    
    private let interactor: FilmsListInteractorProtocol
    
    // MARK: - Initialization
    
    init(navigationDelegate: FilmsListNavigationDelegate, interactor: FilmsListInteractorProtocol) {
        self.navigationDelegate = navigationDelegate
        self.interactor = interactor
    }
    
    // MARK: - FilmsListPresenter Functions
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        let madridGeolocation = "40.4165;-3.70256"
        interactor.getFilms(with: madridGeolocation) { films in
            var items = [FilmsListViewController.Model.Item]()
            
            let group = DispatchGroup()
            
            films.forEach { item in
                group.enter()
                self.interactor.downloadImage(from: item.images.poster.the1.medium.filmImage) { data in
                    let image = UIImage(data: data) ?? UIImage()
                    items.append(.init(image: image,
                                       identidier: item.filmID))
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                self.viewModel = .init(films: items)
                self.viewDelegate?.reloadData()
            }
            
        } failure: { error in
            //TODO: Error
            print(error)
        }

    }
}
