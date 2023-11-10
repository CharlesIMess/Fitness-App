//
//  HomeView.swift
//  FitnessApp
//  Created by Ian Mess on 11/3/23.
//

import SwiftUI

struct HourView: View {
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .stroke(Color.black, lineWidth: 3)
                .frame(width: geometry.size.width / 1.25, height: 50)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 4)
               
        }
    }
}



struct HomeView: View {
    var hrs: Int = 5;
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Text("Today is Sunday Nov. 19th, 2023.")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
               
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0 ..< hrs, id: \.self) { _ in
                            HourView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
