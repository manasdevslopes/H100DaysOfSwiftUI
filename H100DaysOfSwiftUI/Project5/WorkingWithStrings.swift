//
//  WorkingWithStrings.swift
//  H100DaysOfSwiftUI
//
//  Created by MANAS VIJAYWARGIYA on 29/01/21.
//

import SwiftUI

struct WorkingWithStrings: View {
    var body: some View {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let input1 = """
                        a
                        b
                        c
                    """
        let letters1 = input1.components(separatedBy: "\n")
        let randomLetter = letters1.randomElement()
        
        let trimmed = randomLetter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //TODO: the ability to check for misspelled words.
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        
        return Text("Hello, World!")
    }
}

struct WorkingWithStrings_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithStrings()
    }
}
