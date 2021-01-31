//
//  ShowHideViews.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI

struct SecondView: View {
    //TODO: 1-step To dismiss the sheet use @Environment and rest of the line
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    let dg = DragGesture()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .highPriorityGesture(dg)
            
            VStack {
                Text("Hello, \(name)!")
                Button("Dismiss") {
                    //TODO: 2- step: - dismiss the sheet by this method below
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
}


struct ShowHideViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of the sheet
            SecondView(name: "Manas")
        }
    }
}

struct ShowHideViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideViews()
    }
}
