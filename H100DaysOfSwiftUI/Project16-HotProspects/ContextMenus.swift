//
//  ContextMenus.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 10/04/21.
//

import SwiftUI

struct ContextMenus: View {
    @State private var backgroundColor = Color.red
    @State private var num = 0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            
            Text("Change Color")
                .padding()
                .contextMenu(ContextMenu(menuItems: {
                    Button(action: {
                        self.backgroundColor = .red
                        self.num = 0
                    }){
                        Text("Red")
                        if(num == 0) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                    Button(action: {
                        self.backgroundColor = .green
                        self.num = 1
                    }){
                        Text("Green")
                        if(num == 1) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                    Button(action: {
                        self.backgroundColor = .blue
                        self.num = 2
                    }){
                        Text("Blue")
                        if(num == 2) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }))
        }
    }
}

struct ContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenus()
    }
}
