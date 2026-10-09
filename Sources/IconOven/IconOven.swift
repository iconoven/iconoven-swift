import SwiftUI

public extension Image {
    /// An IconOven icon: `Image(iconoven: .bell)`. It sizes and weighs like an SF Symbol: set `.font(.body.weight(.semibold))` and `.imageScale`.
    init(iconoven icon: IconOvenIcon) {
        self.init(icon.assetName, bundle: .module)
    }
}

public extension Label where Title == Text, Icon == Image {
    /// A label with an IconOven icon: `Label("Alerts", iconoven: .bell)`.
    init(_ titleKey: LocalizedStringKey, iconoven icon: IconOvenIcon) {
        self.init { Text(titleKey) } icon: { Image(iconoven: icon) }
    }

    @_disfavoredOverload
    init<S: StringProtocol>(_ title: S, iconoven icon: IconOvenIcon) {
        self.init { Text(title) } icon: { Image(iconoven: icon) }
    }
}

#if canImport(UIKit)
import UIKit

public extension UIImage {
    /// An IconOven icon as a symbol image: `UIImage.iconoven(.bell)`.
    static func iconoven(_ icon: IconOvenIcon, with configuration: UIImage.SymbolConfiguration? = nil) -> UIImage {
        guard let image = UIImage(named: icon.assetName, in: .module, with: configuration) else {
            preconditionFailure("IconOven: missing symbol \(icon.rawValue)")
        }
        return image
    }
}
#elseif canImport(AppKit)
import AppKit

public extension NSImage {
    /// An IconOven icon as a symbol image: `NSImage.iconoven(.bell)`.
    static func iconoven(_ icon: IconOvenIcon) -> NSImage {
        guard let image = Bundle.module.image(forResource: icon.assetName) else {
            preconditionFailure("IconOven: missing symbol \(icon.rawValue)")
        }
        return image
    }
}
#endif
