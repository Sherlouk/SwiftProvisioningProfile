//
//  Created by James Sherlock on 10/04/2018.
//

import Foundation

public extension ProvisioningProfile {
    
    enum ParseError: Error {
        case failedToCreateDecoder
        case failedToCreateData
    }
    
    /// Create a Provisioning Profile object from the file's Data.
    static func parse(from data: Data) throws -> ProvisioningProfile {
        
        guard let decoder = SwiftyCMSDecoder() else {
            throw ParseError.failedToCreateDecoder
        }
        
        decoder.updateMessage(data: data as NSData)
        decoder.finaliseMessage()
        
        guard let data = decoder.data else {
            throw ParseError.failedToCreateData
        }
        
        return try PropertyListDecoder().decode(ProvisioningProfile.self, from: data)
        
    }
    
}
