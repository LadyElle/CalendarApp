//
//  CalendarDayCell.swift
//  CalendarApp
//
//  Created by Michelle Stafford on 2022-08-22.
//

import Foundation
import SwiftUI

struct CalendarDayCell : Identifiable{
    let dayOfWeek: String
    let dayDate: String
    let currentDay: Bool
    var animalImageURL: String
    var id: String {dayOfWeek}
}
