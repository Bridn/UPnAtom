//
//  UPnPArchivable.swift
//
//  Copyright (c) 2015 David Robles
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

// Upgraded for Swift 5 : NSCoding to Swift Codable
open class UPnPArchivable: Codable {
    
    public let usn: String
    public let descriptionURL: URL
    // Upgraded for Swift 5 - Included upnpType and friendlyName for the demo instead of customMetaData: [String : AnyObject] ; it is not compatible with Codable.
    // TODO for Swift 5 : customeMetaData dictionnary need to be conform with Codable.
    public let upnpType: String
    public let friendlyName: String

    // Upgraded for Swift 5
    enum CodingKeys: String, CodingKey {
        case usn
        case descriptionURL
        case upnpType
        case friendlyName
    }
    
    // Upgraded for Swift 5
    init(usn: String, descriptionURL: URL, upnpType: String, friendlyName: String) {
        self.usn = usn
        self.descriptionURL = descriptionURL
        self.upnpType = upnpType
        self.friendlyName = friendlyName
    }
    
    // Upgraded for Swift 5
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        usn = try values.decode(String.self, forKey: .usn)
        descriptionURL = try values.decode(URL.self, forKey: .descriptionURL)
        upnpType = try values.decode(String.self, forKey: .upnpType)
        friendlyName = try values.decode(String.self, forKey: .friendlyName)
    }
    
    // Upgraded for Swift 5
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(usn, forKey: .usn)
        try container.encode(descriptionURL, forKey: .descriptionURL)
        try container.encode(upnpType, forKey: .upnpType)
        try container.encode(friendlyName, forKey: .friendlyName)
    }

}

// Upgraded for Swift 5
extension AbstractUPnP {
    public func archivable(upnpType: String, friendlyName: String) -> UPnPArchivable {
        return UPnPArchivable(usn: usn.rawValue as String, descriptionURL: descriptionURL as URL, upnpType: upnpType as String, friendlyName: friendlyName as String)
    }
}

