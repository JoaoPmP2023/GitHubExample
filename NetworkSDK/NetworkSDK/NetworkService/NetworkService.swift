//
//  NetworkService.swift
//  NetworkSDK
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (BANCO BMG SA – SP) on 19/01/23.
//

import Foundation


open  class NetworkService: NetworkServiceProtocol {
    
    private let cache: URLCache
    private let decoder: JSONDecoder
    private let session: URLSession
    private let taskManager: NetworkTaskManagerProtocol
    private let networkInstance: NetworkSDKInstanceProtocol?
    
    
    public init(session: URLSession = URLSession(configuration: .default),
                 cache: URLCache = URLCache.shared,
                 decoder: JSONDecoder = JSONDecoder(),
                 taskManager: NetworkTaskManagerProtocol = NetworkTaskManager(),
                 networkInstance: NetworkSDKInstanceProtocol?) {
        self.cache = cache
        self.decoder = decoder
        self.session = session
        self.taskManager = taskManager
        self.networkInstance = networkInstance
    }
    
}

// MARK: - Requests

extension NetworkService {
    
    public func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping ResultCallback<T>) {
        guard let request = makeUrlRequest(endpoint: endpoint) else {
            DispatchQueue.main.async { completion(.failure(NetworkError.invalidRequest)) }
            return
        }
        
        // First, check cache
        if let cachedData = cache.cachedResponse(for: request)?.data {
            DispatchQueue.main.async { completion(self.decoded(T.self, data: cachedData)) }
            return
        }
        
        // Otherwise, request from server
        let task = session.dataTask(with: request) { [weak self] data, _, error in
            
            self?.taskManager.removeTask(forRequest: request)
            
            if let error = error as NSError? {
                DispatchQueue.main.async { completion(.failure(NetworkError.errorCode(error.code))) }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(NetworkError.dataMissing)) }
                return
            }
            
            guard let strongSelf = self else { return }
            DispatchQueue.main.async { completion(strongSelf.decoded(T.self, data: data)) }
        }
        
        taskManager.add(task, forRequest: request)
        
        task.resume()
    }
    
    public func cancelRequest(for endpoint: Endpoint) {
        
        let urlRequest = makeUrlRequest(endpoint: endpoint)
        
        guard let request = urlRequest else { return }
        taskManager.task(forRequest: request)?.cancel()
    }
    
}

// MARK: - Decoding

private extension NetworkService {
    
    func decoded<T: Decodable>(_ type: T.Type, data: Data) -> Result<T> {
        do {
            let object = try decoder.decode(T.self, from: data)
            return .success(object)
        } catch {
            debugPrint(error)
            return .failure(NetworkError.decodingFailed)
        }
    }
    
}

// MARK: - Request
private extension NetworkService {
   
    
    func makeUrlRequest(endpoint: Endpoint) -> URLRequest? {
        
        guard let baseUrl = networkInstance?.baseUrl else {
            
            fatalError("NetworkInstance not started")
        }
        
        guard var urlComponents = URLComponents(string: baseUrl) else { return nil }
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        
        guard let url = urlComponents.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.asString
        request.httpBody = endpoint.body
        
        endpoint.headers?.forEach {
            
            request.addValue($1, forHTTPHeaderField: $0)
        }
        
        
        return request
    }
    
}

// MARK: - Network Error

enum NetworkError: Error {
    case dataMissing
    case decodingFailed
    case errorCode(Int)
    case invalidRequest
}
