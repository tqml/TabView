//
//  Theme.swift
//  TabView
//
//  Created by Ian McDowell on 2/2/18.
//  Copyright © 2018 Ian McDowell. All rights reserved.
//

import UIKit

/// Tab view controller can be displayed in various themes.
/// This governs what colors things are.
/// You can create your own themes, by adopting this protocol,
/// or subclassing an existing theme.
@objc public protocol TabViewTheme {
    /// Color of the content view of the tab view controller.
    /// Displayed when there are no tabs, or a tab's view controller is transparent.
    var backgroundColor: UIColor { get }

    /// Color of the active tab's title shown in the bar.
    var barTitleColor: UIColor { get }

    /// A color to apply to the blur effect of the tab view.
    /// Has a minimal effect, similar to the UINavigationBar barTintColor property does.
    var barTintColor: UIColor? { get }

    /// The style of blur to apply to the tab bar.
    var barBlurStyle: UIBlurEffect.Style { get }

    /// Color for separator lines that appear between tabs and underneath tabs.
    var separatorColor: UIColor { get }

    /// The color of the "X" in the close button.
    var tabCloseButtonColor: UIColor { get }

    /// The color of the close button's circle.
    var tabCloseButtonBackgroundColor: UIColor { get }

    /// The background to display in a deselected tab.
    var tabBackgroundDeselectedColor: UIColor { get }

    /// The color of a tab's title when deselected.
    var tabTextColor: UIColor { get }

    /// The color of a tab's title when it is active.
    var tabSelectedTextColor: UIColor { get }

    /// The status bar style (dark or light).
    /// Only matters if UIViewControllerBasedStatusBarAppearance is turned on.
    var statusBarStyle: UIStatusBarStyle { get }
}

/// Light tab view theme.
/// Attempts to mimic UIBarStyleDefault
open class TabViewThemeLight: NSObject, TabViewTheme {
    public var backgroundColor: UIColor = .lightGray
    public var barTitleColor: UIColor = .black
    public var barTintColor: UIColor? = .init(white: 1, alpha: 1)
    public var barBlurStyle: UIBlurEffect.Style = .light
    public var separatorColor: UIColor = .init(white: 0.7, alpha: 1)
    public var tabCloseButtonColor: UIColor = .white
    public var tabCloseButtonBackgroundColor: UIColor = .init(white: 175/255, alpha: 1)
    public var tabBackgroundDeselectedColor: UIColor = .init(white: 0.6, alpha: 0.3)
    public var tabTextColor: UIColor = .init(white: 0.1, alpha: 1)
    public var tabSelectedTextColor: UIColor = .black
    public var statusBarStyle: UIStatusBarStyle = defaultStatusBarStyle()

    private static func defaultStatusBarStyle() -> UIStatusBarStyle {
        if #available(iOSApplicationExtension 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}

/// Dark tab view theme.
/// Attempts to mimic UIBarStyleBlack
open class TabViewThemeDark: NSObject, TabViewTheme {
    public var backgroundColor: UIColor = .darkGray
    public var barTitleColor: UIColor = .white
    public var barTintColor: UIColor? = .init(white: 0.2, alpha: 1)
    public var barBlurStyle: UIBlurEffect.Style = .dark
    public var separatorColor: UIColor = .init(white: 0.15, alpha: 1)
    public var tabCloseButtonColor: UIColor = .init(white: 50/255, alpha: 1)
    public var tabCloseButtonBackgroundColor: UIColor = .init(white: 0.8, alpha: 1)
    public var tabBackgroundDeselectedColor: UIColor = .init(white: 0.4, alpha: 0.3)
    public var tabTextColor: UIColor = .init(white: 0.9, alpha: 1)
    public var tabSelectedTextColor: UIColor = .white
    public var statusBarStyle: UIStatusBarStyle = .lightContent
}

@available(iOS 13.0, *)
open class TabViewThemeDynamic: NSObject, TabViewTheme {
	public var backgroundColor: UIColor = .systemBackground
    public var barTitleColor: UIColor = .label
    public var barTintColor: UIColor? = nil
    public var barBlurStyle: UIBlurEffect.Style = .systemMaterial
    public var separatorColor: UIColor = .separator
    public var tabCloseButtonColor: UIColor = .label
    public var tabCloseButtonBackgroundColor: UIColor = .systemGray4
    public var tabBackgroundDeselectedColor: UIColor = .systemGray5
    public var tabTextColor: UIColor = .secondaryLabel
    public var tabSelectedTextColor: UIColor = .label
    public var statusBarStyle: UIStatusBarStyle = .default
}
