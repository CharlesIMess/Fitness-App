//
//  ScheduleView.swift
//  FitnessApp
//
//  Created by Ian Mess on 11/19/23.
//

import SwiftUI




struct ScheduleView: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        LazyVGrid(columns: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Columns@*/[GridItem(.fixed(200))]/*@END_MENU_TOKEN@*/) {
            Rectangle()
            Rectangle()
            Rectangle()
        }
    }
}

#Preview {
    ScheduleView()
}
