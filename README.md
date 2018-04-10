# SwiftyProvisioningProfile

This library provides a way to decode a `.mobileprovision` file into a Swift model.

#### Installation

The recommended installation is via Swift Package Manager, you'll want to update your `Package.swift` with a new dependency:

```swift
import PackageDescription

let package = Package(
    name: "YourAwesomeSoftware",
    dependencies: [
        .package(url: "https://github.com/Sherlouk/SwiftProvisioningProfile.git", from: "1.0.0")
    ]
)
```

There are open issues to handle CocoaPods and Carthage installation, if people want it then I'm willing to support it!

#### Usage

```swift
// 1. Import the library
import SwiftyProvisioningProfile

// 2. Load your provisioning profile's file data
let profileData = try Data(contentsOf: ...)

// 3. Parse it
let profile = try ProvisioningProfile.parse(from: profileData)

// 4. Use it
print(profile.uuid)
```
