//
//  HomeView.swift
//  FitnessApp
//  Created by Ian Mess on 11/3/23.
//

import SwiftUI

struct Event {
    var id = UUID()
    var name: String
    var time: Int
    var duration: Double // hours
    var color: Color?
}

struct EventView: View {
    var name: String
    var color: Color?
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(color ?? Color.indigo)
                .frame(width: UIScreen.main.bounds.width / 1.50, height: 30)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            Text(name)
                .foregroundColor(.white)
        }
       
        
    }
}

struct HomeView: View {
    
    let events = [
        Event(name: "Clean bathroom", time: 9, duration: 1, color: .blue),
        Event(name: "Do laundry", time: 10, duration: 1, color: .blue),
        Event(name: "Dust", time: 10, duration: 1, color: .blue),
        Event(name: "Vacuum", time: 10, duration: 1, color: .blue),
        Event(name: "Go to dads", time: 14, duration: 1),
        Event(name: "Go to dads", time: 15, duration: 1),
        Event(name: "Visit mom", time: 17, duration: 1, color: .green),
        Event(name: "Watch AOT with husband", time: 21, duration: 1, color: .yellow),
    ]
    
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
                Text("Nov. 25th, 2023")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                
                
                
                List(0 ..< hours, id: \.self) { index in
                    HStack{
                        let time = (index + 1) % 12
                        let isPM = index >= 11 && index < 23
                        
                        Text("\(time == 0 ? 12 : time) \(isPM ? "pm" : "am")")
                            .frame(height: 30)
                  
                        VStack{
                            ForEach(events, id: \.id){ event in
                                if event.time == (index+1){
                                    EventView(name: event.name, color: event.color)
                                }
                            }
                        }
                    }
                    .listRowSeparatorTint(.black)
                    
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
