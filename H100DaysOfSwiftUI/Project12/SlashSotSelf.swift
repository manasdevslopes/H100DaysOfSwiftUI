//
//  SlashSotSelf.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 02/03/21.
//

import SwiftUI

struct SlashSotSelf: View {
    var body: some View {
        List {
            ForEach([2,4,6,8,10], id: \.self) {
                Text("\($0) is even")
            }
        }
    }
}

struct SlashSotSelf_Previews: PreviewProvider {
    static var previews: some View {
        SlashSotSelf()
    }
}
