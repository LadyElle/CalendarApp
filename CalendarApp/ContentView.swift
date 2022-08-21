//
//  ContentView.swift
//  CalendarApp
//
//  Created by Michelle Stafford on 2022-08-19.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink {
                    ShowCalendar(animal: "Cat")
                } label:{
                    Text("Get cat images")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                NavigationLink{
                    ShowCalendar(animal: "Dog")
                } label: {
                    Text("Get dog images")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .navigationTitle("Select your animal type")
    }
}

struct ShowCalendar : View {
    var animal : String
    let days = GetDaysOfWeek()
    var body: some View{
        ScrollView {
            VStack {
                ForEach(days) { day in
                    CalendarRow(animal: animal, day: day.dayOfWeek, date: day.dayDate)
                }
            }.padding()
        }
    }
}

struct Day : Identifiable{
    let dayOfWeek: String
    let dayDate: String
    var id: String {dayOfWeek}
}

func GetDaysOfWeek() -> [Day] {
    let today = Date.now
    let dayOfWeek = Calendar.current.component(.weekday, from: today)
    let days = Calendar.current.range(of: .weekday, in: .weekOfYear, for: today)!
        .compactMap { Calendar.current.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "eeee"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    
    return days.map{ Day(dayOfWeek: dayFormatter.string(from: $0), dayDate: dateFormatter.string(from: $0))}
}

func GetDayOfWeek(day : Int) -> String {
    return Calendar(identifier: .gregorian).weekdaySymbols[day-1].description
}

struct CalendarRow : View{
    var animal : String
    var day : String
    var date : String
    var body: some View{
        HStack {
            Text("\(animal) \(day) \(date)")
        }.padding()
    }
    
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
