//
//  NetworkRequester.swift
//  Unisys
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation
import MobileCoreServices

struct NetworkRequester {
    private let session: URLSession

    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    func requestService<T: Decodable>(request: NetworkRequest, completion: @escaping (ResultResponse<T>) -> Void) {
        session.dataTask(with: request.request, completionHandler: { data, response, requestError in
            if let requestError = requestError {
                completion(.failure(.default(description: requestError.localizedDescription)))
                return
            }
            guard let dataResponse = data else {
                completion(.failure(.invalidData))
                return
            }
            
            // handling errors
            if let urlResponse = response as? HTTPURLResponse {
                switch urlResponse.statusCode {
                case 401:
                    completion(.failure(.error401))
                    return
                case 404:
                    completion(.failure(.error404))
                    return
                case 500:
                    completion(.failure(.error500))
                    return
                default: break
                }
            }
            
            do {
                let mappedResponse = try mapResponse(data: dataResponse, dataType: T.self)
                completion(.success(mappedResponse))
                return
            } catch {
                completion(.failure(.invalidJSON))
                return
            }
        }).resume()
    }

    private func mapResponse<T: Decodable>(data: Data, dataType: T.Type) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}

extension NetworkRequester {
    func doRequest<T: Decodable>(request: APIRequest,
                                 completionHandler: @escaping (ResultResponse<T>) -> Void)
    {
        requestService(request: NetworkRequest(apiRequest: request)) { (result: ResultResponse<T>) in
            switch result {
            case let .success(response):
                completionHandler(.success(response))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
