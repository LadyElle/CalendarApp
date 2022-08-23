//
//  CalendarRowView.swift
//  CalendarApp
//
//  Created by Michelle Stafford on 2022-08-22.
//

import Foundation
import SwiftUI

struct CalendarRowView : View{
    var animalImageURL : String
    var day : String
    var date : String
    var currentDay: Bool
    var body: some View{
        VStack {
            Text("\(day)")
            Spacer()
            Text("\(date)")
        }.padding().background(){
            AsyncImage(url: URL(string: animalImageURL)){ phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                        .opacity(getOpacity())
                }
                else {
                    ProgressView()
                }
            }.frame(width: 300, height: 200)
        }
    }
    
    func getOpacity() -> Double {
        return currentDay ? 1 : 0.5;
    }
}
