//  
//  FilmsListViewController.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import UIKit

// MARK: - Model

extension FilmsListViewController {
    
    struct Model {
        
        let films: [Item]
        
        struct Item {
            let image: UIImage
            let identidier: Int
        }
    }
    
}

class FilmsListViewController: UIViewController {

    // MARK: - Views
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        layout.itemSize = calculateCellSize()
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.register(FilmsListCell.self, forCellWithReuseIdentifier: FilmsListCell.identifier)
        
        return collection
    }()
    
    // MARK: - Properties
    
    private var model: Model?
    
    private var presenter: FilmsListPresenterProtocol
    
	// MARK: - Initializers
	
	init(_ presenter: FilmsListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle.main)
	}
	
	required init?(coder aDecoder: NSCoder) {
        fatalError("This init has not been implemented. Use init(:Presenter) instead.")
	}
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
        
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "CARTELERA"
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        presenter.viewDidLoad()
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
	}
    
    // MARK: - Functions
    
    private func calculateCellSize() -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width / 2) - 15
        return CGSize(width: width, height: width+50)
    }

}

// MARK: - Presenter Delegate

extension FilmsListViewController: FilmsListPresenterDelegate {
    func reloadData() {
        model = presenter.viewModel
        collectionView.reloadData()
    }
}

// MARK: - CollectionView Delegate & DataSource

extension FilmsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let model = model {
            return model.films.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmsListCell.identifier, for: indexPath) as? FilmsListCell else {
            return UICollectionViewCell()
        }
        
        if let model = model {
            let item = model.films[indexPath.row]
            cell.set(image: item.image)
        }
        
        return cell
    }
}
