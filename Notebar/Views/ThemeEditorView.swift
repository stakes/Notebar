//
//  ThemeEditorView.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/31/21.
//

import SwiftUI

struct ThemeEditorView: View {
    @ObservedObject var themeManager: ThemeManager
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 24) {
                    HStack(spacing: 12) {
                        Button(action: {
                            themeManager.setTheme(.system)
                        }) {
                            Image(systemName: "laptopcomputer")
                                .font(.largeTitle)
                                .frame(width: 48, height: 48)
                                .background((themeManager.currentTheme == .system) ? Color(.selectedControlColor) : Color(.controlColor))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .system) ? Color(.selectedControlColor) : Color(.controlColor), lineWidth: 1)
                            ).help("System default")
                        }
                        
                        Button(action: {
                            themeManager.setTheme(.light)
                        }) {
                            Image(systemName: "sun.max")
                                .font(.largeTitle)
                                .frame(width: 48, height: 48)
                                .background((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color(.controlColor))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color(.controlColor), lineWidth: 1)
                            ).help("Light mode")
                        }
                        .buttonStyle(PlainButtonStyle())
                    
                        Button(action: {
                            themeManager.setTheme(.dark)
                        }) {
                            Image(systemName: "moon")
                                .font(.largeTitle)
                                .frame(width: 48, height: 48)
                                .background((themeManager.currentTheme == .dark) ? Color(.selectedControlColor) : Color(.controlColor))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .dark) ? Color(.selectedControlColor) : Color(.controlColor), lineWidth: 1)
                            ).help("Dark mode")
                        }.buttonStyle(PlainButtonStyle())

                        Button(action: {
                            themeManager.setTheme(.custom)
                        }) {
                            Image(systemName: "paintpalette")
                                .font(.largeTitle)
                                .frame(width: 48, height: 48)
                                .background((themeManager.currentTheme == .custom) ? Color(.selectedControlColor) : Color(.controlColor))
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .custom) ? Color(.selectedControlColor) : Color(.controlColor), lineWidth: 1)
                            ).help("Customize")
                        }.buttonStyle(PlainButtonStyle())
                        
                    }
                    Divider().foregroundColor(Color(.separatorColor))
                    VStack {
                        ColorPicker("Text color", selection: $themeManager.customTextColor, supportsOpacity: false)
                            .disabled(themeManager.currentTheme == .custom ? false : /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(themeManager.currentTheme == .custom ? 1 : 0.1)
                            .frame(width: 200, height: 48)
                        ColorPicker("Background color", selection: $themeManager.customBgColor, supportsOpacity: false)
                            .disabled(themeManager.currentTheme == .custom ? false: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(themeManager.currentTheme == .custom ? 1 : 0.1)
                            .frame(width: 200, height: 48)
                    }
                }
                .frame(width: 240, height: 240)
                .padding(12)
                .background(Color(.windowBackgroundColor))
                .cornerRadius(8)
            Spacer()
        }

    }
}


struct ThemeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeEditorView(themeManager: ThemeManager())
    }
}
