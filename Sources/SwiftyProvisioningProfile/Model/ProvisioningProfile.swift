//
//  Created by James Sherlock on 10/04/2018.
//

import Foundation

public struct ProvisioningProfile: Codable {
    
    enum CodingKeys: String, CodingKey {
        case appIdName = "AppIDName"
        case applicationIdentifierPrefixs = "ApplicationIdentifierPrefix"
        case creationDate = "CreationDate"
        case platforms = "Platform"
        case expirationDate = "ExpirationDate"
        case name = "Name"
        case provisionedProfiles = "ProvisionedDevices"
        case teamIdentifiers = "TeamIdentifier"
        case teamName = "TeamName"
        case timeToLive = "TimeToLive"
        case uuid = "UUID"
        case version = "Version"
    }
    
    public var appIdName: String
    public var applicationIdentifierPrefixs: [String]
    public var creationDate: Date
    public var platforms: [String]
    public var expirationDate: Date
    public var name: String
    public var provisionedProfiles: [String]
    public var teamIdentifiers: [String]
    public var teamName: String
    public var timeToLive: Int
    public var uuid: String
    public var version: Int
    
}
