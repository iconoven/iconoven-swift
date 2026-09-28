import XCTest
@testable import IconOven

final class IconOvenTests: XCTestCase {
    func testEveryIconLoads() {
        XCTAssertFalse(IconOvenIcon.allCases.isEmpty)
        let missing = IconOvenIcon.allCases.filter { !loads($0) }.map(\.rawValue)
        XCTAssertEqual(missing, [], "symbols missing from the asset catalogue")
    }

    func testWeightsRender() {
        #if canImport(UIKit)
        for weight in [UIImage.SymbolWeight.ultraLight, .regular, .black] {
            let config = UIImage.SymbolConfiguration(pointSize: 24, weight: weight)
            let image = UIImage.iconoven(IconOvenIcon.allCases[0], with: config)
            XCTAssertGreaterThan(image.size.width, 0)
        }
        #endif
    }

    /// Review sheet: set ICONOVEN_SHEET to a .png path (xcodebuild: TEST_RUNNER_ICONOVEN_SHEET). One row per icon,
    /// Ultralight, Regular and Black at 17, 24 and 44 pt next to body text.
    func testSheet() throws {
        #if canImport(AppKit) && !targetEnvironment(macCatalyst)
        guard let path = ProcessInfo.processInfo.environment["ICONOVEN_SHEET"] else { throw XCTSkip("no ICONOVEN_SHEET") }
        let icons = Array(IconOvenIcon.allCases.prefix(40))
        let weights: [NSFont.Weight] = [.ultraLight, .regular, .black], sizes: [CGFloat] = [17, 24, 44]
        let cell: CGFloat = 64, label: CGFloat = 150
        let size = NSSize(width: label + cell * CGFloat(weights.count * sizes.count), height: cell * CGFloat(icons.count))
        let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(size.width) * 2, pixelsHigh: Int(size.height) * 2,
                                   bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
                                   colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
        rep.size = size
        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
        NSColor.white.setFill()
        NSRect(origin: .zero, size: size).fill()
        for (row, icon) in icons.enumerated() {
            let y = size.height - cell * CGFloat(row + 1)
            (icon.rawValue as NSString).draw(at: NSPoint(x: 8, y: y + cell / 2 - 8),
                                             withAttributes: [.font: NSFont.systemFont(ofSize: 13)])
            for (w, weight) in weights.enumerated() {
                for (s, pt) in sizes.enumerated() {
                    let config = NSImage.SymbolConfiguration(pointSize: pt, weight: weight)
                    let image = NSImage.iconoven(icon).withSymbolConfiguration(config)!
                    let x = label + cell * CGFloat(w * sizes.count + s)
                    image.draw(in: NSRect(x: x + (cell - image.size.width) / 2, y: y + (cell - image.size.height) / 2,
                                          width: image.size.width, height: image.size.height))
                }
            }
        }
        NSGraphicsContext.restoreGraphicsState()
        try rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: path))
        #else
        throw XCTSkip("macOS only")
        #endif
    }

    private func loads(_ icon: IconOvenIcon) -> Bool {
        #if canImport(UIKit)
        UIImage(named: icon.rawValue, in: .module, with: nil) != nil
        #else
        Bundle.module.image(forResource: icon.rawValue) != nil
        #endif
    }
}
