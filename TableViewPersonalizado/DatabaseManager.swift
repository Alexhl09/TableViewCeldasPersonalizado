//
//  DatabaseManager.swift
//  API_App
//
//  Created by Alejandro Hernández López on 07/10/20.
//

import Foundation
import Alamofire
//https://jsonplaceholder.typicode.com/photos
class DatabaseManager {
    static let shared = DatabaseManager(baseURL: URL(string: "https://jsonplaceholder.typicode.com")!)
    
    // Atributos
    let baseURL : URL
    
    private init(baseURL : URL){
        self.baseURL = baseURL
    }
    
    /**
        GetPhotos
     Obtiene un arreglo de fotos desde el API
     */
    func getPhotos(completion: @escaping([Photo]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/photos"),method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            if let data = response.data{
                do {
                    let fotos = try JSONDecoder().decode([Photo].self, from: data)
                    completion(fotos, nil)
                }catch{
                    completion(nil, "Error al decodificar")
                }
            }else{
                completion(nil, "Error en la conexión")
            }
        }
    }
    
    func getTodos(id : String, completion: @escaping([Todos]?, String?)-> Void){
        AF.request(self.baseURL.appendingPathComponent("/todos"),method: .get, parameters: nil, encoding: URLEncoding.httpBody).responseJSON { (response) in
            if let data = response.data{
                do {
                    let todos = try JSONDecoder().decode([Todos].self, from: data)
                    completion(todos, nil)
                }catch{
                    completion(nil, "Error al decodificar")
                }
            }else{
                completion(nil, "Error en la conexión")
            }
        }
    }
    
    
}

