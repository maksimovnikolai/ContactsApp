//
//  NetworkManager.swift
//  ContactsApp
//
//  Created by Nikolai Maksimov on 04.01.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchContacts(completion: @escaping (Result<[Contact], NetworkError>) -> Void) {
        guard let url = URL(string: Link.contactsURL.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let contacts = try decoder.decode([Contact].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(contacts))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
