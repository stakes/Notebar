//
//  ThemeManager.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/31/21.
//

import Foundation
import SwiftUI

enum Theme: String {
    case system = "system"
    case light = "light"
    case dark = "dark"
    case custom = "custom"
}

class ThemeManager: ObservableObject {
    @Published var isThemeEditor: Bool = false
    @Published var currentTheme: Theme {
        didSet {
            UserDefaults.standard.set(currentTheme.rawValue, forKey: "theme")
        }
    }
    @Published var bgColor = Color(.textBackgroundColor)
    @Published var textColor = Color(.textColor )
    @Published var customBgColor = Color(.sRGB, red: 33/255, green: 26/255, blue: 16/255) {
        willSet {
            bgColor = customBgColor
        }
    }
    @Published var customTextColor = Color(.sRGB, red: 162/255, green: 144/255, blue: 112/255) {
        willSet {
            textColor = customTextColor
        }
    }
    
    init() {
        var theme: Theme
        if let data = UserDefaults.standard.object(forKey: "theme") as? String {
            theme = Theme(rawValue: data) ?? Theme.system
        } else {
            theme = Theme.system
        }
        self.currentTheme = theme
        setTextColor(self.currentTheme)
        setBgColor(self.currentTheme)
    }
    
    func showThemeEditor() {
        self.isThemeEditor = true
    }
    func hideThemeEditor() {
        self.isThemeEditor = false
    }
    func setTheme(_ t: Theme) {
        currentTheme = t
        setTextColor(t)
        setBgColor(t)
    }
    func setTextColor(_ t: Theme) {
        switch t {
        case .dark:
            textColor = Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255)
        case .light:
            textColor = Color(.sRGB, red: 7/255, green: 7/255, blue: 7/255)
        case .custom:
            textColor = customTextColor
        case .system:
            textColor = Color(.textColor)
        }
    }
    func setBgColor(_ t: Theme) {
        switch t {
        case .dark:
            bgColor = Color(.sRGB, red: 30/255, green: 30/255, blue: 30/255)
        case .light:
            bgColor = Color(.sRGB, red: 255/255, green: 255/255, blue: 255/255)
        case .custom:
            bgColor = customBgColor
        case .system:
            bgColor = Color(.textBackgroundColor)
        }
    }
}

