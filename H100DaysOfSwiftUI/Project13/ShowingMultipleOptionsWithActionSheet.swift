//
//  ShowingMultipleOptionsWithActionSheet.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 27/03/21.
//

import SwiftUI

struct ShowingMultipleOptionsWithActionSheet: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text("Hello, World!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                    .default(Text("Red")) { self.backgroundColor = .red },
                    .default(Text("Green")) { self.backgroundColor = .green },
                    .default(Text("Blue")) { self.backgroundColor = .blue },
                    .default(Text("White")) { self.backgroundColor = .white },
                    .cancel()
                ])
            }
    }
}

struct ShowingMultipleOptionsWithActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShowingMultipleOptionsWithActionSheet()
    }
}
