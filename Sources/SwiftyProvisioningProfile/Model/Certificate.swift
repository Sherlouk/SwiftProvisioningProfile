//
//  Certificate.swift
//  SwiftyProvisioningProfile
//
//  Created by Sherlock, James on 20/11/2018.
//

import Foundation

public struct Certificate: Encodable, Equatable {

    public enum InitError: Error {
        case failedToFindValue(key: String)
        case failedToCastValue(expected: String, actual: String)
    }
    
    public let notValidBefore: Date
    public let notValidAfter: Date
    
    init(results: [CFString: Any]) throws {
        notValidBefore = try Certificate.getValue(for: kSecOIDX509V1ValidityNotBefore, from: results)
        notValidAfter = try Certificate.getValue(for: kSecOIDX509V1ValidityNotAfter, from: results)
        // TODO: Add more values to this
    }

    static func getValue<T>(for key: CFString, from values: [CFString: Any]) throws -> T {
        let node = values[key] as? [CFString: Any]
        
        guard let rawValue = node?[kSecPropertyKeyValue] else {
            throw InitError.failedToFindValue(key: key as String)
        }
        
        if T.self is Date.Type {
            if let value = rawValue as? TimeInterval {
                // Force unwrap here is fine as we've validated the type above
                return Date(timeIntervalSinceReferenceDate: value) as! T
            }
        }
        
        guard let value = rawValue as? T else {
            let type = (node?[kSecPropertyKeyType] as? String) ?? String(describing: rawValue)
            throw InitError.failedToCastValue(expected: String(describing: T.self), actual: type)
        }
        
        return value
    }
    
}
