//
//  CustomContainers.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 26/01/21.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            //            HStack {
            //                Image(systemName: "\(row * 4 + col).circle")
            //                Text("R\(row) C\(col)")
            //            }
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
