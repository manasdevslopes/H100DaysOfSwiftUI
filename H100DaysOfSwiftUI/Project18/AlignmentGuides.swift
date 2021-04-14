//
//  AlignmentGuides.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 14/04/21.
//

import SwiftUI

struct AlignmentGuides: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Live long and prosper")
                    .frame(width: 300, height: 300, alignment: .topLeading)
                
                //            HStack(alignment: .bottom) {
                HStack(alignment: .lastTextBaseline) {
                    Text("Live")
                        .font(.caption)
                    Text("long")
                    Text("and")
                        .font(.title)
                    Text("prosper")
                        .font(.largeTitle)
                }
                
                VStack(alignment: .leading) {
                    Text("Hello, world!")
                    Text("This is a longer line of text")
                }
                .background(Color.red)
                .frame(width: 400, height: 400)
                .background(Color.blue)
                
                VStack(alignment: .leading) {
                    Text("Hello, world!")
                        .alignmentGuide(.leading) { d in d[.leading] }
                    Text("This is a longer line of text")
                }
                
                VStack(alignment: .leading) {
                    Text("Hello, world!")
                        .alignmentGuide(.leading) { d in d[.trailing] }
                    Text("This is a longer line of text")
                }
                
                VStack(alignment: .leading) {
                    ForEach(0..<10) { position in
                        Text("Number \(position)")
                            .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                    }
                }
                .background(Color.red)
                .frame(width: 400, height: 400)
                .background(Color.blue)
            }
        }
    }
}

struct AlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuides()
    }
}
