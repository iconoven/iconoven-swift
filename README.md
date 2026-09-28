# IconOven for Swift

2,658 free IconOven UI icons for SwiftUI, UIKit and AppKit. Every icon is a custom SF Symbol, so it sizes with your text, sits on the baseline, follows Dynamic Type and takes any weight from Ultralight to Black.

Version 0.1.0. Browse the set at [iconoven.com/ui-icons](https://iconoven.com/ui-icons).

## Install

In Xcode, choose **File › Add Package Dependencies…** and paste:

```
https://github.com/iconoven/iconoven-swift
```

Or add it to `Package.swift`:

```swift
.package(url: "https://github.com/iconoven/iconoven-swift", from: "0.1.0")
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

## Pro

IconOven Pro adds thousands more icons and styles. Pro buyers download the `IconOvenPro` package from their order page. See [iconoven.com/ui-icons/pro](https://iconoven.com/ui-icons/pro).

## Licence

The free icons are MIT licensed. See [LICENSE](LICENSE).

---

A product by Appic Marketing LLC.
