//
//  ThemeManager.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/31/21.
//

import Foundation
import SwiftUI

enum Theme {
    case system
    case light
    case dark
    case custom
}

class ThemeManager: ObservableObject {
    @Published var isThemeEditor: Bool = false
    @Published var currentTheme: Theme = .system
    @Published var bgColor = Color(.textBackgroundColor)
    @Published var textColor = Color(.textColor )
    @Published var customBgColor = Color(.sRGB, red: 33/255, green: 26/255, blue: 16/255)
    @Published var customTextColor = Color(.sRGB, red: 162/255, green: 144/255, blue: 112/255)
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
            textColor = Color.white
        case .light:
            textColor = Color.black
        case .custom:
            textColor = customTextColor
        case .system:
            textColor = Color(.textColor)
        }
    }
    func setBgColor(_ t: Theme) {
        switch t {
        case .dark:
            bgColor = Color.black
        case .light:
            bgColor = Color.white
        case .custom:
            bgColor = customBgColor
        case .system:
            bgColor = Color(.textBackgroundColor)
        }
    }
}

