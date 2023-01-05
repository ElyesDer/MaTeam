//
//  Stubbeable.swift
//  MaTeam
//
//  Created by Derouiche Elyes on 05/01/2023.
//

import Foundation

// does the world even exists ? =D

protocol Stubbeable: Encodable {
    var data: Data? { get }
}

extension Stubbeable {
    var data: Data? {
        return try? JSONEncoder().encode(self).base64EncodedData()
    }
}
