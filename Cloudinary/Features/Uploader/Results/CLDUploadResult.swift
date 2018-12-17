//
//  CLDUploadResult.swift
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

@objc open class CLDUploadResult: CLDBaseResult {
    
    
    // MARK: - Getters
    
    @objc open var publicId: String? {
        return getParam(.publicId) as? String
    }
    
    @objc open var version: String? {
        guard let version = getParam(.version) else {
            return nil
        }
        return String(describing: version)
    }
    
    @objc open var url: String? {
        return getParam(.url) as? String
    }
    
    @objc open var secureUrl: String? {
        return getParam(.secureUrl) as? String
    }
    
    @objc open var resourceType: String? {
        return getParam(.resourceType) as? String
    }
    
    @objc open var signature: String? {
        return getParam(.signature) as? String
    }
    
    @objc open var createdAt: String? {
        return getParam(.createdAt) as? String
    }
    
    open var length: Double? {
        return getParam(.length) as? Double
    }
    
    @objc open var tags: [String]? {
        return getParam(.tags) as? [String]
    }
    
    @objc open var moderation: AnyObject? {
        return getParam(.moderation)
    }

    @objc open var context: [String:[String:String]]? {
        var result: [String:[String:String]]? = nil
        if let c = getParam(.context) as? [String:AnyObject] {
            result = [:]
            for k in c.keys {
                result![k] = c[k] as? [String:String]
            }
        }
        return result;
    }

    // MARK: Image Params
    
    open var width: Int? {
        return getParam(.width) as? Int
    }
    
    open var height: Int? {
        return getParam(.height) as? Int
    }
    
    @objc open var format: String? {
        return getParam(.format) as? String
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
    
    @objc open var phash: String? {
        return getParam(.phash) as? String
    }
    
    @objc open var deleteToken: String? {
        return getParam(.deleteToken) as? String
    }
    
    @objc open var info: CLDInfo? {
        guard let info = getParam(.info) as? [String : AnyObject] else {
            return nil
        }
        return CLDInfo(json: info)
    }
    
    // MARK: Video Params
    
    @objc open var video: CLDVideo? {
        guard let video = getParam(.video) as? [String : AnyObject] else {
            return nil
        }
        return CLDVideo(json: video)
    }
    
    @objc open var audio: CLDAudio? {
        guard let audio = getParam(.audio) as? [String : AnyObject] else {
            return nil
        }
        return CLDAudio(json: audio)
    }
    
    open var frameRte: Double? {
        return getParam(.frameRate) as? Double
    }
    
    open var bitRate: Int? {
        return getParam(.bitRate) as? Int
    }
    
    open var duration: Double? {
        return getParam(.duration) as? Double
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: UploadResultKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    enum UploadResultKey: CustomStringConvertible {
        case signature
        case deleteToken // Image
        case video, audio, frameRate, bitRate, duration // Video
        
        var description: String {
            switch self {
            case .signature:        return "signature"
                
            case .deleteToken:      return "delete_token"
                
            case .video:            return "video"
            case .audio:            return "audio"
            case .frameRate:        return "frame_rate"
            case .bitRate:          return "bit_rate"
            case .duration:         return "duration"
            }
        }
    }
}


// MARK: - Video Result

@objc open class CLDVideo: CLDBaseResult {
    
    @objc open var format: String? {
        return getParam(.pixFormat) as? String
    }
    
    @objc open var codec: String? {
        return getParam(.codec) as? String
    }
    
    open var level: Int? {
        return getParam(.level) as? Int
    }
    
    open var bitRate: Int? {
        return getParam(.bitRate) as? Int
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: VideoKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum VideoKey: CustomStringConvertible {
        case pixFormat, codec, level, bitRate
        
        var description: String {
            switch self {
            case .pixFormat:        return "pix_format"
            case .codec:            return "codec"
            case .level:            return "level"
            case .bitRate:          return "bit_rate"
            }
        }
    }
}

@objc open class CLDAudio: CLDBaseResult {
    
    @objc open var codec: String? {
        return getParam(.codec) as? String
    }
    
    open var bitRate: Int? {
        return getParam(.bitRate) as? Int
    }
    
    open var frequency: Int? {
        return getParam(.frequency) as? Int
    }
    
    open var channels: Int? {
        return getParam(.channels) as? Int
    }
    
    @objc open var channelLayout: String? {
        return getParam(.channelLayout) as? String
    }
    
    // MARK: - Private Helpers
    
    fileprivate func getParam(_ param: AudioKey) -> AnyObject? {
        return resultJson[String(describing: param)]
    }
    
    fileprivate enum AudioKey: CustomStringConvertible {
        case codec, bitRate, frequency, channels, channelLayout
        
        var description: String {
            switch self {
            case .codec:            return "codec"
            case .bitRate:          return "bit_rate"
            case .frequency:        return "frequency"
            case .channels:         return "channels"
            case .channelLayout:    return "channel_layout"
            }
        }
    }
}
