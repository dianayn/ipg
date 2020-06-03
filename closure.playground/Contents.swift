import UIKit

struct WeatherManger {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=fd5408ca5a7666948cba6121b46e8812&units=metric"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }

    func performRequest(urlString: String) {
        // 1 Create a URL
        if let url = URL(string: urlString) {

        }

        //2 Create a URLSession
        let session = URLSession(configuration: .default)

        //3 Give the session a task
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString)
            }

        }
    }
    //4 start the task
        task.resume()
    }
}

let test = WeatherManger()
test.fetchWeather(cityName: "london")


func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add (no1: Int, no2: Int) -> Int {
    return no1 + no2
}



let result = calculator(n1: 2, n2: 3) { $0 * $1}
print(calculator)
