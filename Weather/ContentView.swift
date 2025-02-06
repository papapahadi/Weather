//
//  ContentView.swift
//  Weather
//
//  Created by Jatin Singh on 17/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State private var weatherView = WeatherViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                Spacer()
                
                CityTextView(cityName: "Haldwani, UK")
                //Text("time zone: \(weatherView.weatherResponse?.name ?? "Kanpur") ")
                
                TodayWeather(temp: 10, image: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                HStack(spacing: 20) {
                    WeekView(day: "Tue", image: "cloud.sun.fill", temp: 8)
                    WeekView(day: "Wed", image: "cloud.fill", temp: 7)
                    WeekView(day: "Thu", image: "cloud.sun.fill", temp: 8)
                    WeekView(day: "Fri", image: "sun.max.fill", temp: 9)
                    WeekView(day: "Sat", image: "cloud.sun.fill", temp: 6)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeekView: View {
    var day: String
    var image: String
    var temp: Int
    var body: some View {
        HStack {
            VStack {
                Text(day)
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                Image(systemName: image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temp)°C")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight : Bool
    
    var topColor: Color { isNight ? .black : .blue }
    var midColor: Color { .indigo }
    var bottomColor: Color { isNight ? .gray : .lightBlue }
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, midColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 50, weight: .medium))
            .foregroundColor(.white)
    }
}

struct TodayWeather: View {
    var temp: Int
    var image: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°C")
                .font(.system(size: 70))
                .foregroundStyle(.white)
        }
        .padding(40)
    }
}


