//
//  Address.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 07/02/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
