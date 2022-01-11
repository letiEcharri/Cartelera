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
                "x-api-key": "", //Fill
                "authorization": "", // Fill
                "territory": "XX",
                "device-datetime": getDatetime(),
                "geolocation": "",
                "api-version": "v200"
        ]
    }
    
    private func getDatetime() -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formater.string(from: Date())
    }
    
    
    // MARK: - Private Init
    
    private init() {}
    
}

// MARK: - APIMoviegluDataSource protocol functions

extension APIMoviegluDataSource: APIMoviegluDataSourceProtocol {
    
    func getFilms(with geolocation: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock) {
        let urlString = urlBase + Endpoind.filmsNowShowing
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "URL error in datasource"]) as Error
            failure(error)
            return
        }
        
        var customHeaders = headers
        customHeaders["geolocation"] = geolocation
        
        executeRequest(with: url, httpMethod: .GET, headers: customHeaders, success: success, failure: failure)
    }
    
    func downloadImage(from url: URL, completion: @escaping (Data) -> Void) {
        url.downloadImage { data in
            completion(data)
        }
    }
}
