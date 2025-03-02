//
//  SwiftyCertificate.swift
//  SwiftyProvisioningProfile
//
//  Created by Sherlock, James on 20/11/2018.
//

import Foundation

public extension Certificate {
    
    enum ParseError: Error {
        case failedToCreateCertificate
        case failedToCreateTrust
        case failedToExtractValues
    }
    
    static func parse(from data: Data) throws -> Certificate {
        let certificate = try getSecCertificate(data: data)
        
        var error: Unmanaged<CFError>?
        let values = SecCertificateCopyValues(certificate, nil, &error)
        
        if let error = error {
            throw error.takeRetainedValue() as Error
        }
        
        guard let valuesDict = values as? [CFString: Any] else {
            throw ParseError.failedToExtractValues
        }
        
        var commonName: CFString?
        SecCertificateCopyCommonName(certificate, &commonName)
        
        return try Certificate(results: valuesDict, commonName: commonName as String?)
    }
    
    private static func getSecCertificate(data: Data) throws -> SecCertificate {
        guard let certificate = SecCertificateCreateWithData(kCFAllocatorDefault, data as CFData) else {
            throw ParseError.failedToCreateCertificate
        }
        
        return certificate
    }
    
}
