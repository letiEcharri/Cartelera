//  
//  APIMoviegluDataSource.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Letcia Echarri
//

import Foundation

class APIMoviegluDataSource: DataSource {
    
    struct Endpoind {
        static let filmsNowShowing = "filmsNowShowing/"
    }
    
    // MARK: - Singleton
    
    static let shared: APIMoviegluDataSourceProtocol = APIMoviegluDataSource()
    
    // MARK: - Properties
    
    private var urlBase: String {
        "https://api-gate2.movieglu.com/"
    }
    
    private var headers: [String: String] {
        return ["client": "LETI",
                "x-api-key": "EdLYZt8NH85m6G0FpJJ1cE6qBqkU91O5Q3d4Swta", //Sandbox
                "authorization": "Basic TEVUSV9YWDoyVnkxdThTM2trR0g=",
                "territory": "XX",
                "device-datetime": getDatatime(),
                "geolocation": "",
                "api-version": "v200"
        ]
    }
    
    private func getDatatime() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formater.string(from: Date())
    }
    
    
    // MARK: - Private Init
    
    private init() {}
    
}

// MARK: - APIMoviegluDataSource protocol functions

extension APIMoviegluDataSource: APIMoviegluDataSourceProtocol {
    
    func getFilms() {
        // TODO: Refactor
        
        let urlString = urlBase + Endpoind.filmsNowShowing
        guard let url = URL(string: urlString) else { return }
        
        var customHeaders = headers
        customHeaders["geolocation"] = "40.4165;-3.70256"
        
        executeRequest(with: url, httpMethod: .GET, headers: customHeaders) { object in
            
            guard let jsonData = object as? Data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(FilmsModel.self, from: jsonData)
                
            } catch {
                // TODO: Error
                print(error)
            }
                        
        } failure: { error in
            // TODO: Error
            print(error)
        }

    }
}
