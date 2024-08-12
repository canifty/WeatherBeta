//
//  WeatherView.swift
//  WeatherBeta
//
//  Created by Can Dindar on 2024-07-31.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
//                    Image(systemName: "sparkles").font(.system(size: 100))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }	
            
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer.medium", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                            WeatherRow(logo: "thermometer.medium", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                            WeatherRow(logo: "humidity", name: "Max temp", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.693, saturation: 0.884, brightness: 0.776))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        
        //        .background(Color(hue: 0.693, saturation: 0.884, brightness: 0.776))
                .background(
            LinearGradient(gradient: Gradient(colors: [.indigo, .blue, .teal]), startPoint: .top, endPoint: .bottom)
        )
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.bottom)
//        [Color("Color1"),
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
