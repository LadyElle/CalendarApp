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
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 2, x: 0, y: 0)
            Spacer()
            Text("\(date)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .shadow(color: Color.black, radius: 2, x: 0, y: 0)
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
            }.frame(width: 350, height: 250)
        }
    }
    
    func getOpacity() -> Double {
        return currentDay ? 1 : 0.5;
    }
}
