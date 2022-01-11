//  
//  FilmsListInteractorProtocol.swift
//  Cartelera
//
//  Created by Leticia Echarri on 11/1/22.
//
//  Clean Templates by Leticia Echarri
//

import Foundation

typealias FilmsSuccessBlock = ([Film]) -> Void

protocol FilmsListInteractorProtocol {
    func getFilms(with geolocation: String, success: @escaping FilmsSuccessBlock, failure: @escaping FailureCompletionBlock)
    func downloadImage(from url: String, completion: @escaping (Data) -> Void)
}
