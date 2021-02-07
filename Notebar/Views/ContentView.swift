//
//  ContentView.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/1/21.
//

import SwiftUI

extension NSTextView {
    open override var frame: CGRect {
        didSet {
            backgroundColor = .clear //<<here clear
            drawsBackground = true
        }
    }
}

struct ContentView: View {
    private var placeholder: String = "writesomething"
    @State private var text: String = ""
    @ObservedObject var themeManager = ThemeManager()

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HeaderView(themeManager: themeManager)
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $text)
                        .font(Font.system(.body, design: .monospaced))
                        .padding(.leading, -5)
                        .foregroundColor(themeManager.textColor)
                        .listItemTint(.purple)
                        .accentColor(.purple)
                    if (text == "") {
                        Text(placeholder)
                            .font(Font.system(.body, design: .monospaced))
                            .foregroundColor(themeManager.textColor)
                            .opacity(0.4)
                    }
                }.accentColor(.yellow)
                .padding(12)
                .background(themeManager.bgColor)
            }
            ZStack {
//                if themeManager.isThemeEditor {
                    Color(.shadowColor)
                        .opacity(themeManager.isThemeEditor ? 0.5 : 0)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture {
                            themeManager.hideThemeEditor()
                        }
                        .animation(.easeOut(duration: 0.25))
                    ThemeEditorView(themeManager: themeManager)
                        .frame(width: 240, height: 240)
                        .offset(y: themeManager.isThemeEditor ? 0 : 400)
                        .animation(.easeOut(duration: 0.25))
//                }
                
            }
        }
        .background(Color(.windowBackgroundColor))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

