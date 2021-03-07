//
//  iExpense.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 31/01/21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let data = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = data
                return
            }
        }
        self.items = []
    }
}

struct iExpense: View {
    @ObservedObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                //                ForEach(expenses.items, id: \.id) { item in
                //                    Text(item.name)
                //                }
                ForEach(expenses.items) { item in
                    HStack {
                        Image(systemName: "triangle")
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.caption)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: {
                                        self.showingAddExpense = true
                                    }) {
                                        Image(systemName: "plus")
                                    }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}
