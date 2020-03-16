import UIKit

class CurrencyTextFieldView: UIView {

    let currencyTextField = configure(MyTextField()) {

        $0.backgroundColor = UIColor.purple
        $0.adjustsFontForContentSizeCategory = true
        $0.keyboardType = .numberPad
        $0.keyboardAppearance = .dark

    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(currencyTextField)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



class MyTextField: UITextField {

    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)

   override init(frame: CGRect) {
        super.init(frame: frame)

        Formatter.currency.locale = Locale(identifier: "en_US")
        Formatter.currency.locale = .current
        Formatter.currency.maximumFractionDigits = 0
        Formatter.currency.minimumFractionDigits = 0
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        keyboardType = .numberPad
        sendActions(for: .editingChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.fatalErrorInitCoderNotImplemented)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let leftOffset = leftView?.frame.width ?? 0
        let adjustedPadding = UIEdgeInsets(top: padding.top, left: leftOffset + padding.left, bottom: padding.bottom, right: padding.right)
        return bounds.inset(by: adjustedPadding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    private var decimal: Decimal { string.decimal }
    private let maximum: Decimal = 9_999_999_999_999
    private var lastValue: String?

    override func deleteBackward() {
        text = string.digits.dropLast().string
        // manually send the editingChanged event
        sendActions(for: .editingChanged)
    }

    @objc func editingChanged() {
        guard let txt = text, !txt.isEmpty else {
            return
        }

        guard decimal <= maximum else {
            text = lastValue
            return
        }
        text = decimal.currency
        lastValue = text
    }
}

extension UITextField {
    var string: String { text ?? "" }
}

extension NumberFormatter {
    convenience init(numberStyle: Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}

private extension Formatter {
    static let currency: NumberFormatter = .init(numberStyle: .currency)
}

extension StringProtocol where Self: RangeReplaceableCollection {
    var digits: Self { filter { $0.isWholeNumber } }
}

extension String {
    var decimal: Decimal { Decimal(string: digits) ?? 0 }
}

extension Decimal {
    var currency: String { Formatter.currency.string(for: self) ?? "" }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}



