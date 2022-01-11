//  
//  FilmsListInteractor.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import Foundation

class FilmsListInteractor: FilmsListInteractorProtocol {
    
    // MARK: - Properties
    
    private let datasource: APIMoviegluDataSourceProtocol = APIMoviegluDataSource.shared
    
    // MARK: - FilmsListInteractor functions
    
    func getFilms(with geolocation: String, success: @escaping FilmsSuccessBlock, failure: @escaping FailureCompletionBlock) {
        
        datasource.getFilms(with: geolocation, success: { object in
            
            guard let jsonData = object as? Data else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                failure(error)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(FilmsModel.self, from: jsonData)
                success(response.films)
                
            } catch {
                failure(error)
            }
            
        }, failure: failure)
    }
    
    func downloadImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        datasource.downloadImage(from: url, completion: completion)
    }
}
