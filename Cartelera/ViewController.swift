//
//  ViewController.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "CARTELERA"
        
        view.backgroundColor = .white
        
        let datasource = APIMoviegluDataSource.shared
        datasource.getFilms()
    }


}

