import UIKit

public class FontTestingView: UIStackView {

    private let sizeLabel: UILabel = UILabel()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    func sharedInit() {
        sizeLabel.text = traitCollection.preferredContentSizeCategory.rawValue
        sizeLabel.adjustsFontForContentSizeCategory = true
        addArrangedSubview(sizeLabel)

        UIFontTextStyle.allStyles.forEach { style in
            let label = TextStyleLabel(frame: .zero)
            label.textStyle = style
            label.text = style.debugDescription

            addArrangedSubview(label)
        }
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        sizeLabel.text = traitCollection.preferredContentSizeCategory.rawValue
    }

}
