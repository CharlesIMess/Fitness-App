//
//  HomeView.swift
//  FitnessApp
//  Created by Ian Mess on 11/3/23.
//

import SwiftUI

struct HourView: View {
    var body: some View {
        
            HStack{

                Rectangle()
                    .stroke(Color.black, lineWidth: 2.5)
                    .frame(width: UIScreen.main.bounds.width / 1.35, height: 50)
            }
        
    }
}

struct HomeView: View {
    
    var hours: Int = 17;
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
                    let time = (index + 1) % 12
                    
                    Text("\(time == 0 ? 12 : time) \(index < 11 ? "am" : "pm")")
                        .frame(height: 30)
                    
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
