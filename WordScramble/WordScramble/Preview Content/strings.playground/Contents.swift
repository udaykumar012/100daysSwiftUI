import UIKit
import Foundation
let input = """
a
b
c
"""
let letters = input.components(separatedBy: "\n")
print(letters)
let letter = letters.randomElement()//give optional random string
print(letter!)
let trimmedletter = letter?.trimmingCharacters(in: .whitespacesAndNewlines)

//UI TEXT CHECKER
func spellChecker(_ str : String ){
    let word = str
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let missplledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    let isSpellCorrect =  (missplledRange.location == NSNotFound)
    print("spelling correct : \(isSpellCorrect)")
    print(missplledRange,missplledRange.location,missplledRange.length)
}

spellChecker("friend")
spellChecker("holexsa")
