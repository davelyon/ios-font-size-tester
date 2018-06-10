import UIKit

/*
 A subclass of UILabel intended to by provided font sizing only via
 `textStyle`.

 This UILabel will default to resizing based on the content size category.
 */
public class TextStyleLabel: UILabel {

    public var textStyle: UIFontTextStyle = .body {
        didSet {
            font = textStyle.scaledCustomFont()
            adjustsFontForContentSizeCategory = true
        }
    }

}
