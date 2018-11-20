//
//  DeveloperCertificate.swift
//  SwiftyProvisioningProfile
//
//  Created by Sherlock, James on 13/05/2018.
//

import Foundation

public struct DeveloperCertificate: Codable, Equatable {
    
    public let data: Data
    public let certificate: Certificate?
    
    // MARK: - Codable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        data = try container.decode(Data.self)
        certificate = try? Certificate.parse(from: data)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(data)
    }
    
    // MARK: - Convenience
    
    public var base64Encoded: String {
        return data.base64EncodedString()
    }
    
}
