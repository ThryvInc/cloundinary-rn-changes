//
//  CLDRenameResult.swift
//
//  Copyright (c) 2016 Cloudinary (http://cloudinary.com)
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
//

import Foundation

@objc open class CLDRenameResult: CLDBaseResult {
    
    // MARK: - Getters
    
    @objc open var publicId: String? {
        return getParam(.publicId) as? String
    }
    
    @objc open var format: String? {
        return getParam(.format) as? String
    }
    
    @objc open var version: String? {
        guard let version = getParam(.version) else {
            return nil
        }
        return String(describing: version)
    }
    
    @objc open var resourceType: String? {
        return getParam(.resourceType) as? String
    }
    
    @objc open var type: String? {
        return getParam(.urlType) as? String
    }
    
    @objc open var createdAt: String? {
        return getParam(.createdAt) as? String
    }
    
    open var length: Double? {
        return getParam(.length) as? Double
    }
    
    open var width: Int? {
        return getParam(.width) as? Int
    }
    
    open var height: Int? {
        return getParam(.height) as? Int
    }
    
    @objc open var url: String? {
        return getParam(.url) as? String
    }
    
    @objc open var secureUrl: String? {
        return getParam(.secureUrl) as? String
    }
    
    @objc open var nextCursor: String? {
        return getParam(.nextCursor) as? String
    }
    
    @objc open var exif: [String : String]? {
        return getParam(.exif) as? [String : String]
    }
    
    @objc open var metadata: [String : String]? {
        return getParam(.metadata) as? [String : String]
    }
    
    @objc open var faces: AnyObject? {
        return getParam(.faces)
    }
    
    @objc open var colors: AnyObject? {
        return getParam(.colors)
    }
    
    @objc open var derived: CLDDerived? {
        guard let derived = getParam(.derived) as? [String : AnyObject] else {
            return nil
        }
        return CLDDerived(json: derived)
    }
    
    @objc open var tags: [String]? {
        return getParam(.tags) as? [String]
    }
    
    @objc open var moderation: AnyObject? {
        return getParam(.moderation)
    }
    
    @objc open var context: AnyObject? {
        return getParam(.context)
    }
    
    @objc open var phash: String? {
        return getParam(.phash) as? String
    }
    
    @objc open var predominant: CLDPredominant? {
        guard let predominant = getParam(.predominant) as? [String : AnyObject] else {
            return nil
        }
        return CLDPredominant(json: predominant)
    }
    
    @objc open var coordinates: CLDCoordinates? {
        guard let coordinates = getParam(.coordinates) as? [String : AnyObject] else {
            return nil
        }
        return CLDCoordinates(json: coordinates)
    }
    
    @objc open var info: CLDInfo? {
        guard let info = getParam(.info) as? [String : AnyObject] else {
            return nil
        }
        return CLDInfo(json: info)
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: RenameResultKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }

    fileprivate enum RenameResultKey: CustomStringConvertible {
        case nextCursor, derived, predominant, coordinates
        
        var description: String {
            switch self {
            case .nextCursor:       return "next_cursor"
            case .derived:          return "derived"            
            case .predominant:      return "predominant"
            case .coordinates:      return "coordinates"
            }
        }
    }
}


// MARK: - CLDCoordinates

@objc open class CLDCoordinates: CLDBaseResult {
    
    @objc open var custom: AnyObject? {
        return getParam(.custom)
    }
    
    @objc open var faces: AnyObject? {
        return getParam(.faces)
    }
    
    // MARK: Private Helpers
    
    fileprivate func getParam(_ param: CLDCoordinatesKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum CLDCoordinatesKey: CustomStringConvertible {
        case custom
        
        var description: String {
            switch self {
            case .custom:           return "custom"
            }
        }
    }
}


// MARK: - CLDPredominant

@objc open class CLDPredominant: CLDBaseResult {
    
    @objc open var google: AnyObject? {
        return getParam(.google)
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: CLDPredominantKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum CLDPredominantKey: CustomStringConvertible {
        case google
        
        var description: String {
            switch self {
            case .google:           return "google"
            }
        }
    }
}


// MARK: - CLDDerived

@objc open class CLDDerived: CLDBaseResult {
    
    @objc open var transformation: String? {
        return getParam(.transformation) as? String
    }
    
    @objc open var format: String? {
        return getParam(.format) as? String
    }
    
    open var length: Double? {
        return getParam(.length) as? Double
    }
    
    @objc open var identifier: String? {
        return getParam(.id) as? String
    }
    
    @objc open var url: String? {
        return getParam(.url) as? String
    }
    
    @objc open var secureUrl: String? {
        return getParam(.secureUrl) as? String
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: CLDDerivedKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum CLDDerivedKey: CustomStringConvertible {
        case transformation, id
        
        var description: String {
            switch self {
            case .transformation:           return "transformation"
            case .id:                       return "id"
            }
        }
    }
}
