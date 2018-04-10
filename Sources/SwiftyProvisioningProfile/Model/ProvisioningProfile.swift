//
//  Created by James Sherlock on 10/04/2018.
//

import Foundation

/// Structure describing a Provisioning Profile and its contents
public struct ProvisioningProfile: Codable {
    
    enum CodingKeys: String, CodingKey {
        case appIdName = "AppIDName"
        case applicationIdentifierPrefixs = "ApplicationIdentifierPrefix"
        case creationDate = "CreationDate"
        case platforms = "Platform"
        case expirationDate = "ExpirationDate"
        case name = "Name"
        case provisionedDevices = "ProvisionedDevices"
        case teamIdentifiers = "TeamIdentifier"
        case teamName = "TeamName"
        case timeToLive = "TimeToLive"
        case uuid = "UUID"
        case version = "Version"
    }
    
    /// The name you gave your App ID in the provisioning portal
    public var appIdName: String
    
    /// The App ID prefix (or Bundle Seed ID) generated when you create a new App ID
    public var applicationIdentifierPrefixs: [String]
    
    /// The date in which this profile was created
    public var creationDate: Date
    
    /// The platforms in which this profile is compatible with
    public var platforms: [String]
    
    /// The date in which this profile will expire
    public var expirationDate: Date
    
    /// The name of the profile you provided in the provisioning portal
    public var name: String
    
    /// An array of device UUIDs that are provisioned on this profile
    public var provisionedDevices: [String]
    
    /// An array of team identifier of which this profile belongs to
    public var teamIdentifiers: [String]
    
    /// The name of the team in which this profile belongs to
    public var teamName: String
    
    /// The number of days that this profile is valid for. Usually one year (365)
    public var timeToLive: Int
    
    /// The profile's unique identifier, usually used to reference the profile from within Xcode
    public var uuid: String
    
    /// The provisioning profiles version number, currently set to 1.
    public var version: Int
    
}
