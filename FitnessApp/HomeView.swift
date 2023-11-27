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
    var startEnd: String
}

struct EventView: View {
    
    var index: Int
    var event_list: [Event]
    var time: Int
    var isPm: Bool
    var isEvent: Bool
    var first: Int
    var last: Int
    


    init(index: Int, event_list: [Event]) {
        self.index = index + 1
        self.event_list = event_list.filter { $0.time ==  index + 1}
        self.time = (index + 1) % 12
        self.isPm = index >= 11 && index < 23
        self.isEvent = !event_list.filter { $0.time ==  index + 1}.isEmpty
    }
    
    
    var body: some View {
        if isEvent {
            VStack{
                ForEach(event_list, id: \.id){ event in
                        ZStack{
                        Rectangle()
                            .fill(event.color ?? Color.indigo)
                            .frame(width: UIScreen.main.bounds.width / 1.19, height: 35)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        HStack{
                            Text("\(time == 0 ? 12 : time) \(isPm ? "pm" : "am") \(":")")
                                .frame(height: 20)
                                .foregroundColor(.white)
                                .padding(.leading)
                                
                            Spacer()
                            Text(event.name)
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(event.startEnd)")
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
            }
            
        }
        else{
            Text("\(time == 0 ? 12 : time) \(isPm ? "pm" : "am") \(":")")
                .font(.system(size: 15))
        }
    }
}

struct HomeView: View {
    
    let events = [
        Event(name: "Clean bathroom", time: 9, duration: 1, color: .blue, startEnd: "9:00-10:00"),
        Event(name: "Do laundry", time: 10, duration: 0.33, color: .red, startEnd: "10:00-10:20"),
        Event(name: "Dust", time: 10, duration: 0.33, color: .orange, startEnd: "10:20-10:40"),
        Event(name: "Vacuum", time: 10, duration: 0.33, color: .blue, startEnd: "10:40-11:00"),
        Event(name: "Go to dads", time: 14, duration: 1, startEnd: "12:00-1:00"),
        Event(name: "Go to dads", time: 15, duration: 1, startEnd: "1:00-2:00"),
        Event(name: "Visit mom", time: 17, duration: 1, color: .green, startEnd: "5:00-6:00"),
        Event(name: "Watch AOT", time: 21, duration: 1, color: .yellow, startEnd: "9:00-10:00"),
    ]
    
    var hours: Int = 24
    var backgroundColor: Color = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    var body: some View {
                
        
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text(Date().formatted(date: .long, time: .omitted))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(Date().formatted(date: .omitted, time: .shortened))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                
                
                
                List(0 ..< hours, id: \.self) { index in
                    EventView(index: index, event_list: events)
                        .listRowSeparatorTint(.black)
                }
                .listStyle(InsetListStyle())
                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.75)
                .cornerRadius(5.0)
                .padding()
                
                
                
                
                
                Spacer()
                Text("Add Event:")
                    .bold()
                    .padding(.trailing, 30)
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
