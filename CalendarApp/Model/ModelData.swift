//
//  ModelData.swift
//  CalendarApp
//
//  Created by Michelle Stafford on 2022-08-22.
//

import Foundation
import SwiftUI

struct Result: Codable, Identifiable{
    var id: String
    var url: String
}

func GetCalendarDayCellDetails() async -> [CalendarDayCell] {
    let today = Date.now
    let dayOfWeek = Calendar.current.component(.weekday, from: today)
    let days = Calendar.current.range(of: .weekday, in: .weekOfYear, for: today)!
        .compactMap { Calendar.current.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
    
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "eeee"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d"
    
    let animalURLs = await GetImageURL()
    
    return days.map{ CalendarDayCell(dayOfWeek: dayFormatter.string(from: $0), dayDate: dateFormatter.string(from: $0), currentDay: today == $0, animalImageURL: animalURLs[days.firstIndex(of: $0)!])}
}

func GetImageURL() async -> [String]{

    var imageURLs = [String]()
    let searchURL = URL(string: "https://api.thecatapi.com/v1/images/search?limit=7")

    do {
        let (data, _) = try await URLSession.shared.data(from: searchURL!)
        let decodedResponse = try! JSONDecoder().decode([Result].self, from: data)
        for result in decodedResponse{
            imageURLs.append(result.url)
        }
    } catch {
        print("Invalid data")
    }
    return imageURLs
}
