//
//  ContentView.swift
//  Bullseye
//
//  Created by Anthony Richir on 07/02/2020.
//  Copyright © 2020 Anthony Richir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            
            // Slider
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                    
                
                Text("100")
            }
            Spacer()
            
            // Button row
            HStack {
                Button(action: {
                    print("Button pressed!")
                    self.alertIsVisible = true
                }) {
                    Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    let roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello there!"), message: Text("The slider value is \(roundedValue).\n" +
                        "You score \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")))
                }
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func pointsForCurrentRound() -> Int {
        let roundedValue = Int(self.sliderValue.rounded())
        return 100 - abs(roundedValue - self.target)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
