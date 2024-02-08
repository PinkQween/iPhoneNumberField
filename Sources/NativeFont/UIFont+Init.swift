//
//  UIFont+Init.swift
//  iPhoneNumberField
//
//  Created by Kalil Fine on 11/1/20.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
public typealias UIFont = NSFont
public typealias UIFontDescriptor = NSFontDescriptor
#endif

public extension UIFont {
    /// Initializes a `UIFont` using the same system initializer syntax available in `Font` 🔠🔡
    /// - Parameters:
    ///   - size: The font size as a `CGFloat`
    ///   - weight: Font weight from the `UIFont.Weight` types
    ///   - design: Font design from the `UIFontDescriptor.SystemDesign` options
    @available(macOS 10.15, *)
    convenience init?(size: CGFloat = 14, weight: UIFont.Weight = .regular, design: UIFontDescriptor.SystemDesign = .rounded) {
        // Will be SF Compact or standard SF in case of failure.
        // Just pass in proper inputs and this should not fail

        // Use the appropriate conditional compilation for macOS or iOS
//        #if os(iOS)
//        let systemFont = NativeFont.systemFont(ofSize: size, weight: weight)
//        #else
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
//        #endif
        
        if let descriptor = systemFont.fontDescriptor.withDesign(design) {
            self.init(descriptor: descriptor, size: size)
        } else {
            self.init()
        }
    }
}
