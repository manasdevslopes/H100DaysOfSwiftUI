//
//  ResortDetailsView.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 17/04/21.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort
    
    //    var size: String {
    //        ["Small", "Average", "Large"][resort.size - 1]
    //    }
    //That works, but it would cause a crash if an invalid value was used, and it’s also a bit too cryptic for my liking. Instead, it’s safer and clearer to use a switch block like this:
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    var body: some View {
        Group {
            Text("Size: \(size)").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Price: \(price)").layoutPriority(1)
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
