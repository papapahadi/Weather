//
//  WeatherButtonView.swift
//  Weather
//
//  Created by Jatin Singh on 29/01/25.
//

import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .clipShape(.rect(cornerRadius: 10))
    }
}
