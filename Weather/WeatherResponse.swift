//
//  WeatherData.swift
//  Weather
//
//  Created by Jatin Singh on 30/01/25.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: MainWeatherData
}

struct MainWeatherData: Codable {
    let temp: Double
    let humidity: Int
}



