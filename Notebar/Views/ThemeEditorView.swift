//
//  ThemeEditorView.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/31/21.
//

import SwiftUI

struct ThemeEditorView: View {
    @ObservedObject var themeManager: ThemeManager
    @State private var bgColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 24) {
                    HStack(spacing: 12) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "laptopcomputer")
                                .font(.largeTitle)
                        }.buttonStyle(PlainButtonStyle())
                        .frame(width: 48, height: 48)
                        .background((themeManager.currentTheme == .system) ? Color(.selectedControlColor) : Color.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .system) ? Color(.selectedControlColor) : Color.black, lineWidth: 1)
                        ).help("System default")
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "moon")
                                .font(.largeTitle)
                                
                        }.buttonStyle(PlainButtonStyle())
                        .frame(width: 48, height: 48)
                        .background((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black, lineWidth: 1)
                        ).help("Light mode")
                    
                        Button(action: {
                            
                        }) {
                            Image(systemName: "sun.max")
                                .font(.largeTitle)
                        }.buttonStyle(PlainButtonStyle())
                        .frame(width: 48, height: 48)
                        .background((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black, lineWidth: 1)
                        ).help("Dark mode")
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "paintpalette")
                                .font(.largeTitle)
                        }.buttonStyle(PlainButtonStyle())
                        .frame(width: 48, height: 48)
                        .background((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke((themeManager.currentTheme == .light) ? Color(.selectedControlColor) : Color.black, lineWidth: 1)
                        ).help("Customize")
                    }
                    Divider().foregroundColor(Color(.separatorColor))
                    VStack {
                        ColorPicker("Text color", selection: $bgColor)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(0.1)
                        ColorPicker("Background color", selection: $bgColor)
                            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .opacity(0.1)
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
