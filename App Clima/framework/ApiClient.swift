//
//  ApiClient.swift
//  App Clima
//
//  Created by juan castañeda on 1/08/22.
//

import Foundation

public class APIClient {
    
    public static var shared = APIClient()
    
    private init() { }
    
    func get<T: Codable>(_ to: String, parameters: [String: String], completion: @escaping (Int, T?) -> Void) {

        guard let url = URL(string: to) else {
            return
        }
        
        var components = URLComponents(string: to)
        components?.queryItems = parameters.map({ URLQueryItem(name: $0, value: $1)})
        
        var request = URLRequest(url: components?.url ?? url)
        request.httpMethod = "GET"
        request.httpShouldHandleCookies = true
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.global(qos: .background).async {
                
                let status = response?.getStatusCode() ?? 500
                
                guard error == nil else {
                    
                    DispatchQueue.main.async {
                        completion(status, nil)
                    }
                    
                    // notify to firebase the error
                    
                    return
                }
                
                guard let data = data else {
                    
                    DispatchQueue.main.async {
                        completion(status, nil)
                    }
                    // notify that data has error
                    
                    return
                }
                
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(status, model)
                    }
                } catch let jsonError {
                    DispatchQueue.main.async {
                        completion(status, nil)
                    }
                    debugPrint(jsonError)
                }
                
            }
        }.resume()
        
    }
}

extension URLResponse {
    
    func getStatusCode() -> Int? {
        
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        
        return nil
    }
}

