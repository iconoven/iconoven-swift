# IconOven for Swift

Every IconOven UI icon in the Stroke style, free for SwiftUI, UIKit and AppKit. Each icon is a custom SF Symbol, so it sizes with your text, sits on the baseline, follows Dynamic Type and takes any weight from Ultralight to Black.

Version 1.0.1. Browse the set at [iconoven.com/icons](https://iconoven.com/icons).

## Install

In Xcode, choose **File › Add Package Dependencies…** and paste:

```
https://github.com/iconoven/iconoven-swift
```

Or add it to `Package.swift`:

```swift
.package(url: "https://github.com/iconoven/iconoven-swift", from: "1.0.1")
```

and add `"IconOven"` to your target's dependencies.

Requires iOS 15, macOS 12, tvOS 15, watchOS 8 or visionOS 1.

## Use

```swift
import IconOven

Image(iconoven: .bell)
    .font(.title2.weight(.semibold))
    .foregroundStyle(.tint)

Label("Alerts", iconoven: .bell)

Button { } label: { Image(iconoven: .creditCard) }
```

UIKit and AppKit:

```swift
let bell = UIImage.iconoven(.bell, with: .init(textStyle: .body))
let lock = NSImage.iconoven(.lock)
```

`IconOvenIcon` lists every icon and is `CaseIterable`, so you can build pickers from `IconOvenIcon.allCases`. Case names match the React package: `credit-card` is `.creditCard`.

## Sizing and weight

Icons behave like SF Symbols:

- `.font(.body)` or `.font(.system(size: 24))` sets the size.
- `.font(.body.weight(.light))` through `.weight(.black)` changes the stroke weight. On iOS 16 and macOS 13 and later, `.fontWeight(_:)` works too.
- `.imageScale(.small | .medium | .large)` adjusts the size relative to the text.

## Other styles

This package is every IconOven icon in the Stroke style, free. IconOven Pro adds the other 12 styles (solid, duotone, pop and others) for the web, React and design tools; there is no Pro package for Swift. See [iconoven.com/icons/pro](https://iconoven.com/icons/pro).

## Licence

Every icon in this package is MIT licensed. See [LICENSE](LICENSE).

---

A product by Appic Marketing LLC.
