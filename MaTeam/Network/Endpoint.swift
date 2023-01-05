//
//  Endpoints.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

public protocol NetworkProvider {
    var method: HTTPMethods { get }
    var endURL: APIProvider { get }
    func buildURLRequest() throws -> URLRequest
}

enum NetworkProviderError: Error {
    case urlBuilder
    case urlRequest
}

public enum HTTPMethods: String {
    case get = "GET"
}

public struct Endpoint: NetworkProvider {
    
    public var method: HTTPMethods
    public let endURL: APIProvider
    
    public init(method: HTTPMethods,
                endURL: APIProvider) {
        self.method = method
        self.endURL = endURL
    }
    
    public func buildURLRequest() throws -> URLRequest {
        guard let url = URL(string: self.endURL.rawValue) else { throw NetworkProviderError.urlBuilder }
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
