import UIKit

extension UIFont {


    #if DEBUG

    static func showAllFonts() {
        UIFont.familyNames.forEach { family in
            print(family)
            print("\t\(UIFont.fontNames(forFamilyName: family).joined(separator: "\n\t"))")
        }
    }

    #endif

}
