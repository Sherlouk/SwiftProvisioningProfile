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
    
    lazy var testProfileURL: URL = {
        guard let bundle = resourceBundle else {
            fatalError("Tests are being run through Xcode, or the project structure no longer matches up")
        }
        
        guard let url = bundle.url(forResource: "TestProfile", withExtension: "mobileprovision") else {
            fatalError("No `TestProfile.mobileprovision` found in `Tests/SwiftyProvisioningProfileTests/Resources`")
        }
        
        return url
    }()
    
    func testParse() {
        
        do {
            let data = try Data(contentsOf: testProfileURL)
            let profile = try ProvisioningProfile.parse(from: data)
            
            print(profile)
            // TODO: Create or find a simple & usable profile and wrtie actual tests for it
        } catch {
            XCTFail(String(describing: error))
        }

    }

    static var allTests = [
        ("testParse", testParse),
    ]
}
