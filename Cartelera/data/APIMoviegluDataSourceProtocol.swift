//  
//  APIMoviegluDataSourceProtocol.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import Foundation

protocol APIMoviegluDataSourceProtocol {
    func getFilms(with geolocation: String, success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock)
    func downloadImage(from url: URL, completion: @escaping (Data) -> Void)
}
