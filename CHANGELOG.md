# Changelog

## 1.0.0 (2026-10-09)

The new IconOven library. This is a major release because many icon names changed.

### Added
- Every IconOven icon in the Stroke style as a custom SF Symbol, free under MIT, from Ultralight to Black.
- The badge icons (`-alert`, `-check`, `-clock`, `-edit`, `-lock`, `-minus`, `-plus`, `-search`, `-star`, `-x`), with the stroke cut away around the badge at every weight.

### Changed
- Many icons have new names, and some names now point at a different drawing. Old case names still compile as deprecated aliases (for example `.changelog` warns and points to `.releaseNotes`); Xcode's fix-it swaps in the new name. The aliases go away in 2.0.0. The full old → new list is `RENAMED.json` in the `@iconoven/icons` npm package; Swift case names are the same names in camel case (`credit-card` is `.creditCard`).

### Removed
- Old names with no matching icon in the new set. `RENAMED.json` lists them under `removed`.
- IconOven Pro for Swift. Swift is Stroke only, so every icon is in this package.

## 0.1.0 (2026-09-28)

- 2,658 free icons as custom SF Symbols.
- `Image(iconoven:)`, `Label(_:iconoven:)`, `UIImage.iconoven(_:)` and `NSImage.iconoven(_:)`.
