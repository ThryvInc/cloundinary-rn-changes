//
//  CLDTextRequestParams.swift
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

/**
 This class represents the different parameters that can be passed when performing a request to generate a text-image.
 */
open class CLDTextRequestParams: CLDRequestParams {
    
    // MARK: Init
    
    public override init() {
        super.init()
    }
    
    /**
    Initializes a CLDTextRequestParams instance.
    
    - parameter text:       The text string to generate an image for.
    
    - returns:              A new instance of CLDTextRequestParams.
    */
    @objc internal init(text: String) {
        super.init()
        setParam(TextParams.Text.rawValue, value: text)
    }
    
    /**
     Initializes a CLDTextRequestParams instance.
     
     - parameter params:    A dictionary of the request parameters.
     
     - returns:             A new instance of CLDTextRequestParams.
     */
    @objc public init(params: [String : AnyObject]) {
        super.init()
        self.params = params
    }
    
    // MARK: Set Params
    
    /**
    Set an identifier that is used for accessing the generated image. 
    If not specified, a unique identifier is generated by Cloudinary.
    
    - parameter text:       The identifier.
    
    - returns:              A new instance of CLDTextRequestParams.
    */
    @objc @discardableResult
    open func setPublicId(_ publicId: String) -> CLDTextRequestParams {
        setParam(TextParams.PublicId.rawValue, value: publicId)
        return self
    }
    
    /**
     Set a font family.
     
     - parameter fontFamily:        The name of the font family.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontFamily(_ fontFamily: String) -> CLDTextRequestParams {
        setParam(TextParams.FontFamily.rawValue, value: fontFamily)
        return self
    }
    
    /**
     Set the font size in points.
     
     - parameter fontSize:          The font size in points. default is 12.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontSizeFromInt(_ fontSize: Int) -> CLDTextRequestParams {
        return setFontSize(String(fontSize))
    }
    
    /**
     Set the font size in points.
     
     - parameter fontSize:          The font size in points. default is 12.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontSize(_ fontSize: String) -> CLDTextRequestParams {
        setParam(TextParams.FontSize.rawValue, value: fontSize)
        return self
    }
    
    /**
     Set the font size in points.
     
     - parameter fontColor:         A name or RGB representation of the font's color. For example: `red` or #ff0000. default is black.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontColor(_ fontColor: String) -> CLDTextRequestParams {
        setParam(TextParams.FontColor.rawValue, value: fontColor)
        return self
    }
    
    /**
     Set the font weight.
     
     - parameter fontWeight:        The font weight to set. default is normal.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @discardableResult
    @objc(setFontWeightFromFontWeight:)
    open func setFontWeight(_ fontWeight: CLDFontWeight) -> CLDTextRequestParams {
        return setFontWeight(String(describing: fontWeight))
    }
    
    /**
     Set the font weight.
     
     - parameter fontWeight:        The font weight to set. default is normal.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontWeight(_ fontWeight: String) -> CLDTextRequestParams {
        setParam(TextParams.FontWeight.rawValue, value: fontWeight)
        return self
    }
    
    /**
     Set the font style.
     
     - parameter fontStyle:        The font style to set. default is normal.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @discardableResult
    @objc(setFontStyleFromFontStyle:)
    open func setFontStyle(_ fontStyle: CLDFontStyle) -> CLDTextRequestParams {
        return setFontStyle(String(describing: fontStyle))
    }
    
    /**
     Set the font style.
     
     - parameter fontStyle:        The font style to set. default is normal.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setFontStyle(_ fontStyle: String) -> CLDTextRequestParams {
        setParam(TextParams.FontStyle.rawValue, value: fontStyle)
        return self
    }
    
    /**
     Set the background color.
     
     - parameter background:    A name or RGB representation of the background color. For example: `red` or #ff0000. default is transparent.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setBackground(_ background: String) -> CLDTextRequestParams {
        setParam(TextParams.Background.rawValue, value: background)
        return self
    }
    
    /**
     Set the text opacity level from 0 to 100.
     
     - parameter opacity:           The text opacity value between 0 (invisible) and 100. default is 100.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setOpacity(_ opacity: Int) -> CLDTextRequestParams {
        setParam(TextParams.Opacity.rawValue, value: opacity)
        return self
    }
    
    /**
     Set a text decoration to add the the generated text, for example: underline.
     
     - parameter textDecoration:    The text decoration to set. default is none.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @discardableResult
    @objc(setTextDecorationFromTextDecoration:)
    open func setTextDecoration(_ textDecoration: CLDTextDecoration) -> CLDTextRequestParams {
        return setTextDecoration(String(describing: textDecoration))
    }
    
    /**
     Set a text decoration to add the the generated text, for example: underline.
     
     - parameter textDecoration:    The text decoration to set. default is none.
     
     - returns:                     A new instance of CLDTextRequestParams.
     */
    @objc @discardableResult
    open func setTextDecoration(_ textDecoration: String) -> CLDTextRequestParams {
        setParam(TextParams.TextDecoration.rawValue, value: textDecoration)
        return self
    }
    
    
    
    fileprivate enum TextParams: String {
        case Text =                 "text"
        case PublicId =             "public_id"
        case FontFamily =           "font_family"
        case FontSize =             "font_size"
        case FontColor =            "font_color"
        case FontWeight =           "font_weight"
        case FontStyle =            "font_style"
        case Background =           "background"
        case Opacity =              "opacity"
        case TextDecoration =       "text_decoration"
    }
}
