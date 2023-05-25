//
//  MainAppView.swift
//  GuessTheFlagAPP
//
//  Created by Uday Kumar Kotla on 25/05/23.
//

import SwiftUI

struct MainAppView: View {
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria","Poland","Russia","Spain","UK","US"]
    @State private var clickedAnswer = ""
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var result = ""
    @State private var showNext : Bool = false
    @State private var finalResult : (score:Int,noOfQuestions:Int,percentage:Double) = (0,0,0)
    @State private var showMyResult : Bool = false
    func checkAnswer(){
        if(clickedAnswer == countries[correctAnswer])
        {
            result = "Correct answer"
            return
        }
        result = "Wrong answer"
    }
    func calScore(){
        finalResult.noOfQuestions += 1
        if(result == "Correct answer"){
            finalResult.score += 10
        }
        finalResult.percentage =  Double(finalResult.score)/(10*Double(finalResult.noOfQuestions)) * 100
    }
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                // LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: .blue, location: 0.5),
                    .init(color: .red, location: 0.5),
                    
                ]), startPoint: .top, endPoint: .bottom)
                //                RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.4), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                //                center: .top, startRadius:88 , endRadius: 500)
                
            }.ignoresSafeArea()
            if(showMyResult){
                VStack{
                    
                    VStack(spacing: 50){
                        
                        Text("Tap the flag of \(countries[correctAnswer])")
                            .font(.title.weight(.heavy))
                            .foregroundStyle(.thickMaterial)
                        
                        ForEach(0..<3){ num in
                            Button{
                                clickedAnswer = countries[num]
                                checkAnswer()
                                calScore()
                                showNext = true
                            }label: {
                                Image(countries[num].lowercased())
                                    .renderingMode(.original)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .shadow(radius: 20,x:20)
                            }
                            
                        }
                        .alert("\(result) you clicked : \(clickedAnswer)", isPresented: $showNext) {
                            Button("Continue"){
                                countries = countries.shuffled()
                            }
                            Button("Cancel",role: .cancel){
                                showMyResult = true
                            }
                        }message: {
                            Text("Would you like to continue the game?")
                        }
                    }
                    //            VStack{
                    //                Text(result)
                    //                Button("Next"){
                    //                    showScore = true
                    //
                    //                }.buttonStyle(.borderedProminent)
                    //                    .tint(.red)
                    //            }.foregroundStyle(.white)
                    //                    .alert("Your score is ", isPresented: $showScore) {
                    //                        Button("Continue"){
                    //                            countries = countries.shuffled()
                    //                        }
                    //                        Button("Cancel",role: .cancel){
                    //
                    //                        }
                    //                    }message: {
                    //                        Text("Would you like to continue the game?")
                    //                    }
                    
                    VStack{
                        Text("score : \(finalResult.score)")
                        
                    }.font(.title).foregroundColor(.white)
                    Button("Exit"){
                        showMyResult = true
                    }.buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.1, green: 0.2, blue: 0.76))
                }
            }
            else{
                
                VStack{
                    NavigationView{
                        Form{
                            LabeledContent("score :", value:" \(finalResult.score)")
                            
                            LabeledContent("No of questions attempted :",value:" \(finalResult.noOfQuestions)")
                            Section{
                                Text(" \(finalResult.percentage,specifier : "%.2f")%")
                                    .foregroundColor(.white)
                            }header: {
                                Text("Percentage ").foregroundColor(.black)
                            }
                            .listRowBackground(Color.red)
                            
                        }
                        .background(Color.cyan)
                            .scrollContentBackground(.hidden)
                        .navigationBarTitle("Result")
                        
                        
                    }
                    
                    .frame(maxWidth: .infinity,maxHeight: 300)
                    
                    Button("New Game"){
                        showMyResult = false
                        finalResult = (0,0,0)
                    }.buttonStyle(.borderedProminent)
                        
                }
               
                
            }
        }
        .onChange(of: countries) { newValue in
            result = ""
            correctAnswer = Int.random(in: 0...2)
            
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
