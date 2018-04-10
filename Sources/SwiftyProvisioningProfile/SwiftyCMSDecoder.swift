//
//  Created by James Sherlock on 10/04/2018.
//

import Foundation

/// Swift wrapper around Apple's Security `CMSDecoder` class
final class SwiftyCMSDecoder {
    
    var decoder: CMSDecoder
    
    /// Initialises a new `SwiftyCMSDecoder` which in turn creates a new `CMSDecoder`
    init?() {
        var newDecoder: CMSDecoder?
        CMSDecoderCreate(&newDecoder)
        
        guard let decoder = newDecoder else {
            return nil
        }
        
        self.decoder = decoder
    }
    
    /// Feed raw bytes of the message to be decoded into the decoder. Can be called multiple times.
    ///
    /// - Parameter data: The raw data you want to have decoded
    /// - Returns: Success - `false` upon detection of improperly formatted CMS message.
    @discardableResult
    func updateMessage(data: NSData) -> Bool {
        return CMSDecoderUpdateMessage(decoder, data.bytes, data.length) != errSecUnknownFormat
    }
    
    /// Indicate that no more `updateMessage()` calls are coming; finish decoding the message.
    ///
    /// - Returns: Success - `false` upon detection of improperly formatted CMS message.
    @discardableResult
    func finaliseMessage() -> Bool {
        return CMSDecoderFinalizeMessage(decoder) != errSecUnknownFormat
    }
    
    /// Obtain the actual message content (payload), if any. If the message was signed with
    /// detached content then this will return `nil`.
    ///
    /// - Warning: This cannot be called until after `finaliseMessage()` is called!
    var data: Data? {
        var newData: CFData?
        CMSDecoderCopyContent(decoder, &newData)
        return newData as Data?
    }
    
}
