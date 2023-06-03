//
//  MainAppView.swift
//  WordScramble
//
//  Created by Uday Kumar Kotla on 29/05/23.
//

import SwiftUI

struct MainAppView: View {
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var usedWords = [String]()
    @State private var errorTitle = ""
    @State private var animationAmount = 1.0
    @State var score : Int = 0
    func addNewWord(){
        errorTitle = ""
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard (answer.count>0) else {
            return
        }
        if(usedWords.contains(answer)){
            errorTitle = "Word already used"
        }
        if(isValidWord(answer) && !usedWords.contains(answer) && isPossibleWord()){
            withAnimation {
                usedWords.insert(answer, at: 0)
            }
            score += answer.count
        }
       
       
    }
    func isValidWord(_ answer:String)->Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: answer.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: answer, range: range, startingAt: 0, wrap: false, language: "en")
        let allgood = (misspelledRange.location == NSNotFound)
        if(!allgood){
            errorTitle = "check your spelling"
        }
        return allgood
    }
    
    func isPossibleWord() -> Bool{
        var tmpRootWord =  rootWord
        for letter in newWord{
            if let pos = tmpRootWord.firstIndex(of: letter){
                tmpRootWord.remove(at: pos)
            }else{
                errorTitle = "not a possible word"
                return false
            }
        }
        return true
    }
    
    //loading file
    func startGame(){
        score = 0
        newWord = ""
        usedWords = []
        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let fileContents = try? String(contentsOf: fileUrl){
                let allWords = fileContents.components(separatedBy: "\n")
                rootWord = (allWords.randomElement() ?? "start").lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            }
            return
        }
        else{
            fatalError("could not load the start.txt file")
        }
    }
    var body: some View {
        VStack{
            NavigationView {
                List{
                    Section {
                        TextField("Enter Your Word", text: $newWord).autocorrectionDisabled()
                            .autocapitalization(.none)
                        
                    }footer: {
                        Text(errorTitle).foregroundColor(.red)
                    }
                    Section{
                        ForEach(usedWords,id: \.self){
                            word in
                            HStack{
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }.toolbar {
                    Text("Score \(score)")
                }.padding(0)
                .navigationTitle(rootWord)
            }.onSubmit {
                addNewWord()
            }
            .onAppear(){
                startGame()
            }
            
            
            Button("New Game"){
                print(animationAmount)
                startGame()
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay {
                Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                                .opacity(2 - animationAmount)
                                .animation(
                                    .easeInOut(duration: 1)
                                        .repeatForever(autoreverses: false),
                                    value:animationAmount
                                )
            }
            .onAppear {
                animationAmount = 2
            }
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
