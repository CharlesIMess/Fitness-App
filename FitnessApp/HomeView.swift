//
//  HomeView.swift
//  FitnessApp
//  Created by Ian Mess on 11/3/23.
//

import SwiftUI

struct Event {
    var name: String
    var duration: TimeInterval
    var time: Date
}

struct HourView: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(Color.indigo)
                .frame(width: UIScreen.main.bounds.width / 1.50, height: 30)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Text("CLASS")
                .foregroundColor(.white)
        }
       
        
    }
}

struct HomeView: View {
    
    var hours: Int = 24;
    var backgroundColor: Color = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    var body: some View {
                
        
        ZStack{
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Sunday,")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Nov. 19th, 2023")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                
                
                
                
                List(0 ..< hours, id: \.self) { index in
                    HStack{
                        let time = (index + 1) % 12
                        let isPM = index >= 11 && index < 23
                        
                        Text("\(time == 0 ? 12 : time) \(isPM ? "pm" : "am")")
                            .frame(height: 30)
                        Spacer()
                        HourView()
                    }
                    
                }
                .listStyle(InsetListStyle())
                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.75)
                .cornerRadius(5.0)
                .padding()
                
                
                
                
                
                Spacer()
                Text("Add Event:")
                    .bold()
                Button(action: {
                    print("Button tapped!")
                }) {
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .scaledToFit()
                }
                
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    HomeView()
}
