//
//  ContentView.swift
//  CalendarApp
//
//  Created by Michelle Stafford on 2022-08-19.
//

import SwiftUI

struct ContentView : View {
    @State private var calendarDayCells = [CalendarDayCell]()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(calendarDayCells) { calendarDayCell in
                    CalendarRowView(animalImageURL: calendarDayCell.animalImageURL, day: calendarDayCell.dayOfWeek, date: calendarDayCell.dayDate, currentDay: calendarDayCell.currentDay)
                        .frame(width: 300, height: 200, alignment: .center)
                        .border(.black, width: 1)
                }
            }.padding()
        }.task {
            calendarDayCells = await GetCalendarDayCellDetails()
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
