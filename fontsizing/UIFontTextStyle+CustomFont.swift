import UIKit

fileprivate let _largeTitle: (String, CGFloat)   = ( "AvenirNext-Heavy", 34.0 )

fileprivate let _title1: (String, CGFloat)       = ( "AvenirNext-DemiBold", 28.0 )
fileprivate let _title2: (String, CGFloat)       = ( "AvenirNext-Medium", 22.0 )
fileprivate let _title3: (String, CGFloat)       = ( "AvenirNext-Regular", 20.0 )

fileprivate let _headline: (String, CGFloat)     = ( "AvenirNext-DemiBold", 17.0 )
fileprivate let _subheadline: (String, CGFloat)  = ( "AvenirNext-UltraLight", 17.0 )

fileprivate let _body: (String, CGFloat)         = ( "AvenirNext-Regular", 17.0 )
fileprivate let _callout: (String, CGFloat)      = ( "AvenirNext-DemiBold", 16.0 )

fileprivate let _footnote: (String, CGFloat)     = ( "AvenirNext-Regular", 15.0 )

fileprivate let _caption1: (String, CGFloat)     = ( "AvenirNext-Medium", 13.0 )
fileprivate let _caption2: (String, CGFloat)     = ( "AvenirNext-Regular", 11.0 )

extension UIFontTextStyle {

    public static let ultraLargeTitle: UIFontTextStyle = .init(rawValue: "TitleUltraLarge")

    /**
     The UIFont metrics for a given font style, useful if you need to do content sizing as well.
     */
    var fontMetrics: UIFontMetrics {
        return UIFontMetrics(forTextStyle: self)
    }

    /**
     The scaled custom UIFont for a given text style, optionally scaled per the trait collection
     */
    func scaledCustomFont(for traitCollection: UITraitCollection? = nil) -> UIFont {
        let (name, size) = UIFontTextStyle.sizeMap[self]!
        let customFont = UIFont(name: name, size: size)!

        if let traitCollection = traitCollection {
            if let maximumPointSize = maximumPointSize {
                return fontMetrics.scaledFont(for: customFont, maximumPointSize: maximumPointSize, compatibleWith: traitCollection)
            }
            return fontMetrics.scaledFont(for: customFont, compatibleWith: traitCollection)
        }

        if let maximumPointSize = maximumPointSize {
            return fontMetrics.scaledFont(for: customFont, maximumPointSize: maximumPointSize)
        }

        return fontMetrics.scaledFont(for: customFont)
    }

    /**
     The un-scaled custom UIFont for a given text style
     */
    fileprivate var customFont: UIFont {
        let (name, size) = UIFontTextStyle.sizeMap[self]!
        return UIFont(name: name, size: size)!
    }

    /**
     (Optionally) Provide the maximum point size by text style
     */
    fileprivate var maximumPointSize: CGFloat? {
        switch self {
        case .largeTitle: return 44.0
        default: return nil
        }
    }

    fileprivate static let sizeMap: [ UIFontTextStyle: (String, CGFloat) ] = [
        .largeTitle:  _largeTitle,
        .title1:      _title1,
        .title2:      _title2,
        .title3:      _title3,
        .headline:    _headline,
        .subheadline: _subheadline,
        .body:        _body,
        .callout:     _callout,
        .footnote:    _footnote,
        .caption1:    _caption1,
        .caption2:    _caption2,
        ]

    static let allStyles: [UIFontTextStyle] = [
        .largeTitle,
        .title1,
        .title2,
        .title3,
        .headline,
        .subheadline,
        .body,
        .callout,
        .footnote,
        .caption1,
        .caption2
    ]

    var debugDescription: String {
        // Drop the `UICTFontTextStyle` prefix
        return String(self.rawValue.dropFirst(17))
    }
}

#if swift(>=4.2)
extension UIFontTextStyle: CaseIterable {
    public typealias AllCases = [UIFontTextStyle]

    public static var allCases: AllCases {
        return [
            .largeTitle,
            .title1,
            .title2,
            .title3,
            .headline,
            .subheadline,
            .body,
            .callout,
            .footnote,
            .caption1,
            .caption2
        ]
    }
}
#endif
