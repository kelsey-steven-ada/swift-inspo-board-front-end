import Foundation
import SwiftUI

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

let gradient = LinearGradient(
    colors: [
        .blue.opacity(0.3),
        .green.opacity(0.5)
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

// Extension to allow easy styling of TabViews
// https://swiftuirecipes.com/blog/swiftui-tabview-styling-all-ios-versions
// Relies on TabView using UITabBar & UITabBarItem, could break
// if SwiftUI changes their implementation in the future
extension View {
  func tabViewStyle(backgroundColor: Color? = nil,
                    itemColor: Color? = nil,
                    selectedItemColor: Color? = nil,
                    badgeColor: Color? = nil) -> some View {
    onAppear {
      let itemAppearance = UITabBarItemAppearance()
      if let uiItemColor = itemColor?.uiColor {
        itemAppearance.normal.iconColor = uiItemColor
        itemAppearance.normal.titleTextAttributes = [
          .foregroundColor: uiItemColor
        ]
      }
      if let uiSelectedItemColor = selectedItemColor?.uiColor {
        itemAppearance.selected.iconColor = uiSelectedItemColor
        itemAppearance.selected.titleTextAttributes = [
          .foregroundColor: uiSelectedItemColor
        ]
      }
      if let uiBadgeColor = badgeColor?.uiColor {
        itemAppearance.normal.badgeBackgroundColor = uiBadgeColor
        itemAppearance.selected.badgeBackgroundColor = uiBadgeColor
      }

      let appearance = UITabBarAppearance()
      if let uiBackgroundColor = backgroundColor?.uiColor {
        appearance.backgroundColor = uiBackgroundColor
      }

      appearance.stackedLayoutAppearance = itemAppearance
      appearance.inlineLayoutAppearance = itemAppearance
      appearance.compactInlineLayoutAppearance = itemAppearance

      UITabBar.appearance().standardAppearance = appearance
      if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
      }
    }
  }
}

// Extension to get a UIColor object from a Color object
// Need UIColor objects for setting values on UITabBar & UITabBarItem
extension Color {
  var uiColor: UIColor? {
    if #available(iOS 14.0, *) {
      return UIColor(self)
    } else {
      let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
      var hexNumber: UInt64 = 0
      var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
      let result = scanner.scanHexInt64(&hexNumber)
      if result {
        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: a)
      } else {
        return nil
      }
    }
  }
}
