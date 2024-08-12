//
//  ContentView.swift
//  WeatherBeta
//
//  Created by Can Dindar on 2024-07-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentLocation(latitude: location.latitude, longitude: location.longitude)
                            } catch  {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
            
        }
        .background(Color(hue: 0.693, saturation: 0.884, brightness: 0.776))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
