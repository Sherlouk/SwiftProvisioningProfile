//
//  Created by James Sherlock on 10/04/2018.
//

import XCTest
@testable import SwiftyProvisioningProfile

class SwiftyProvisioningProfileTests: XCTestCase {
    
    lazy var resourceBundle: Bundle? = {
        // Note: This will fail if run via Xcode, and depends highly on the projects structure.
        // SPM doesn't currently support resources, this is a temporary (and fragile) solution until it does.
        let currentBundle = Bundle(for: SwiftyProvisioningProfileTests.self)
        return Bundle(path: "\(currentBundle.bundlePath)/../../../../Tests/SwiftyProvisioningProfileTests/Resources")
    }()
    
    lazy var testProfileURLs: [URL] = {
        guard let bundle = resourceBundle else {
            fatalError("Tests are being run through Xcode, or the project structure no longer matches up")
        }
        
        guard let urls = bundle.urls(forResourcesWithExtension: "mobileprovision", subdirectory: nil) else {
            fatalError("No `mobileprovision` files found in `Tests/SwiftyProvisioningProfileTests/Resources`")
        }
        
        return urls
    }()
    
    lazy var testCertificateURLs: [URL] = {
        guard let bundle = resourceBundle else {
            fatalError("Tests are being run through Xcode, or the project structure no longer matches up")
        }
        
        guard let urls = bundle.urls(forResourcesWithExtension: "cer", subdirectory: nil) else {
            fatalError("No `cer` files found in `Tests/SwiftyProvisioningProfileTests/Resources`")
        }
        
        return urls
    }()
    
    func testParseIOS() {
        
        do {
            for url in testProfileURLs {
                let data = try Data(contentsOf: url)
                let profile = try ProvisioningProfile.parse(from: data)
                
                print(profile.name)
            }
            
            // TODO: Create or find a simple & usable profile and write actual tests for it
        } catch {
            XCTFail(String(describing: error))
        }

    }
    
    func testParseCertificate() {
        
        do {
            for url in testCertificateURLs {
                let data = try Data(contentsOf: url)
                let certificate = try Certificate.parse(from: data)
                
                print(certificate)
            }
            
            // TODO: Create or find a simple & usable certificate and write actual tests for it
        } catch {
            XCTFail(String(describing: error))
        }
        
    }
    
    func testParseMAC() {
        
        // TODO
        
    }

    static var allTests = [
        ("testParseIOS", testParseIOS),
        ("testParseMAC", testParseMAC),
        ("testParseCertificate", testParseCertificate),
    ]
}
