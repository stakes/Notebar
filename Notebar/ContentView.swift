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

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView()
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
            }.padding(12)
        }.background(Color(.windowBackgroundColor))
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


