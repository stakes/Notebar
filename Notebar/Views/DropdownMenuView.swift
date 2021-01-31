//
//  DropdownMenuView.swift
//  Notebar
//
//  Created by Jay Stakelon on 1/30/21.
//

import SwiftUI

struct DropdownMenuView: NSViewRepresentable {
    
    @ObservedObject var themeManager: ThemeManager
        
    func makeNSView(context: Context) -> NSPopUpButton {
        
        let dropdown = NSPopUpButton(frame: CGRect(x: 0, y: 0, width: 48, height: 24), pullsDown: true)
        dropdown.menu!.autoenablesItems = false
        return dropdown
        
    }
    
    func updateNSView(_ nsView: NSPopUpButton, context: Context) {
        
        nsView.removeAllItems()
        
        let iconItem = NSMenuItem()
        let iconImage = NSImage(named: "GearIcon")
        iconImage?.size = NSSize(width: 12, height: 12)
        iconItem.image = iconImage
        
        let themeItem = NSMenuItem(title: "Change theme", action: #selector(Coordinator.themeAction), keyEquivalent: "")
        themeItem.representedObject = self.themeManager
        themeItem.target = context.coordinator

        let quitItem = NSMenuItem(title: "Quit", action: #selector(Coordinator.quitAction), keyEquivalent: "q")
        quitItem.target = context.coordinator

        nsView.menu?.insertItem(iconItem, at: 0)
        nsView.menu?.insertItem(themeItem, at: 1)
        nsView.menu?.insertItem(NSMenuItem.separator(), at: 2)
        nsView.menu?.insertItem(quitItem, at: 3)

        let cell = nsView.cell as? NSButtonCell
        cell?.imagePosition = .imageOnly
        cell?.bezelStyle = .texturedRounded

        nsView.wantsLayer = true
        nsView.layer?.backgroundColor = NSColor.clear.cgColor
        nsView.isBordered = false
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject {
        @objc func quitAction(_ sender: NSMenuItem) {
            NSApplication.shared.terminate(self)
        }
        @objc func themeAction(_ sender: NSMenuItem) {
            let tm = sender.representedObject as! ThemeManager
            tm.showThemeEditor()
        }
    }
}
