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
                        .foregroundColor(Color(.textColor))
                    if (text == "") {
                        Text(placeholder)
                            .font(Font.system(.body, design: .monospaced))
                            .foregroundColor(Color(.placeholderTextColor))
                    }
                }
                .padding(12)
                .background(Color(.textBackgroundColor))
            }
            if (themeManager.isThemeEditor) {
                ZStack {
                    Color("Scrim")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture {
                            themeManager.hideThemeEditor()
                        }
                    ThemeEditor(themeManager: themeManager)
                        .frame(width: 240, height: 240)
                }
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

class ThemeManager: ObservableObject {
    @Published var isThemeEditor: Bool = false
    func showThemeEditor() {
        self.isThemeEditor = true
    }
    func hideThemeEditor() {
        self.isThemeEditor = false
    }
}

struct ThemeEditor: View {
    @ObservedObject var themeManager: ThemeManager
    var body: some View {

        HStack {
            Spacer()
                HStack {
                    Text("Theme editor")
                }.frame(width: 240, height: 240)
                .background(Color(.windowBackgroundColor))
                .cornerRadius(8)
            Spacer()
        }

    }
}
