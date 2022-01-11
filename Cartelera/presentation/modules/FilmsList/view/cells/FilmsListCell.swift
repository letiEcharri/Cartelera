//
//  FilmsListCell.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//

import UIKit

class FilmsListCell: UICollectionViewCell {
    
    static var identifier: String {
        "FilmsListCell"
    }
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
                
        return imageView
    }()
    
    func set(image: UIImage) {
        picture.image = image
        
        addSubview(picture)
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: trailingAnchor),
            picture.topAnchor.constraint(equalTo: topAnchor),
            picture.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
