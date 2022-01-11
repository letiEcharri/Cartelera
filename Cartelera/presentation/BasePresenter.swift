//
//  BasePresenter.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import Foundation

class BasePresenter {
    
    func viewWillAppear() {}
        
    func viewDidLoad() {}
    
    func viewDidAppear() {}
    
    func viewDidDisappear() {}
}

protocol BasePresenterDelegate: AnyObject {
    func reloadData()
}
