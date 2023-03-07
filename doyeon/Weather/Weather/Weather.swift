//
//  Weather.swift
//  Weather
//
//  Created by Doyeon on 2023/03/06.
//

struct Weather: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    var getWeatherImage: String {
        switch state {
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return ""
        }
    }
    
    var fahrenheit: Float { // 화씨
        return (celsius * 9/5) + 32
    }
    
    var getTemp: String {
        let formattedFahrenheit = String(format: "%.1f", fahrenheit)
        return "섭씨 \(celsius)도 / 화씨 \(formattedFahrenheit)도"
    }
    
    var getRainfallProb: String {
        return "강수확률 \(rainfallProbability)%"
    }
    
    enum CodingKeys: String, CodingKey {
        case cityName = "city_name"
        case state, celsius
        case rainfallProbability = "rainfall_probability"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cityName = try container.decode(String.self, forKey: .cityName)
        self.state = try container.decode(Int.self, forKey: .state)
        self.celsius = try container.decode(Float.self, forKey: .celsius)
        self.rainfallProbability = try container.decode(Int.self, forKey: .rainfallProbability)
    }
}
