//
//  SecureCertificate.swift
//  SwiftyProvisioningProfile
//
//  Created by Sherlock, James on 13/05/2018.
//

import Foundation

public struct SecureCertificate: CustomStringConvertible, Equatable {
    
    public enum CertificateError: Error {
        case failedToCreate
        case failedToObtainSummary
        case failedToObtainValues
    }
    
    public let summary: String
    public let expiryDate: Date?
    
    public init(base64EncodedData: Data) throws {
        
        // Create Certificate
        
        guard let certificate = SecCertificateCreateWithData(nil, base64EncodedData as CFData) else {
            throw CertificateError.failedToCreate
        }
        
        // Error
        
        var error: Unmanaged<CFError>?
        
        func checkError() throws {
            if let error = error {
                throw error.takeUnretainedValue()
            }
        }
        
        // Summary
        
        guard let summary = SecCertificateCopySubjectSummary(certificate) else {
            throw CertificateError.failedToObtainSummary
        }
        
        self.summary = summary as String
        
        // Values (Expiry)
        
        let valuesKeys = [
            kSecOIDInvalidityDate
        ] as CFArray
        
        let values = SecCertificateCopyValues(certificate, valuesKeys, &error)
        try checkError()
        
        guard let dictionary = values as? Dictionary<CFString, Any> else {
            throw CertificateError.failedToObtainValues
        }
        
        let expiryDateDictionary = dictionary[kSecOIDInvalidityDate] as? [String: Any]
        expiryDate = expiryDateDictionary?["value"] as? Date
        
    }
    
    public var description: String {
        return "\(summary), Expires: \(expiryDate?.description ?? "No Expiry Date")"
    }
    
}
