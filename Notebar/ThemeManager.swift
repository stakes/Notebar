//
//  ThemeManager.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/31/21.
//

import Foundation

enum Theme {
    case system
    case light
    case dark
    case custom
}

class ThemeManager: ObservableObject {
    @Published var isThemeEditor: Bool = false
    @Published var currentTheme: Theme = .system
    func showThemeEditor() {
        self.isThemeEditor = true
    }
    func hideThemeEditor() {
        self.isThemeEditor = false
    }
}

