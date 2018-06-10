import XCTest

#if swift(>=4.2)
extension UIContentSizeCategory: CaseIterable {
    public typealias AllCases = [UIContentSizeCategory]
    public static var allCases: AllCases {
        return [
            .extraSmall,
            .small,
            .medium,
            .large, // Default
            .extraLarge,
            .extraExtraLarge,
            .extraExtraExtraLarge,
            .accessibilityMedium,
            .accessibilityLarge,
            .accessibilityExtraLarge,
            .accessibilityExtraExtraLarge,
            .accessibilityExtraExtraExtraLarge,
            .unspecified
        ]
    }

}
#else
extension UIContentSizeCategory {
    public static var allCases: [UIContentSizeCategory] {
        return [
            .extraSmall,
            .small,
            .medium,
            .large, // Default
            .extraLarge,
            .extraExtraLarge,
            .extraExtraExtraLarge,
            .accessibilityMedium,
            .accessibilityLarge,
            .accessibilityExtraLarge,
            .accessibilityExtraExtraLarge,
            .accessibilityExtraExtraExtraLarge,
            .unspecified
        ]
    }

}
#endif

class FontSizingUITests: XCTestCase {

    override class var defaultTestSuite: XCTestSuite {
        let suite = XCTestSuite.init(forTestCaseClass: FontSizingUITests.self)

        UIContentSizeCategory.allCases.forEach { size in

            let test = FontSizingUITests(selector: #selector(runSnapshot))
            test.contentSizeCategory = size
            suite.addTest(test)
        }
        return suite
    }

    var contentSizeCategory: UIContentSizeCategory!

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        let app = XCUIApplication()

        XCTContext.runActivity(named: "set content size category to: \(contentSizeCategory.rawValue)") { _ in
            app.launchArguments = [
                "-UIPreferredContentSizeCategoryName",
                contentSizeCategory.rawValue,
            ]
        }

        app.launch()
    }

    @objc func runSnapshot() {
        XCTContext.runActivity(named: "Font Snapshot: \(contentSizeCategory.rawValue)") { activity in
            let screenshot = XCUIScreen.main.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.lifetime = .keepAlways
            #if swift(>=4.2)
            let index = UIContentSizeCategory.allCases.firstIndex(of: contentSizeCategory) ?? 999
            #else
            let index = UIContentSizeCategory.allCases.index(of: contentSizeCategory) ?? 999
            #endif
            attachment.name = "\(String(format: "%02d", index))-\(contentSizeCategory.rawValue)"

            activity.add(attachment)
        }
    }
}

