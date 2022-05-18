import UIKit

//Codable
//json data의 형태를 struct로 선언
struct userData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

//sample json api
//https://jsonplaceholder.typicode.com
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
var request = URLRequest(url: url)

//header를 추가할 경우
//request.setValue(
//    "authToken",
//    forHTTPHeaderField: "Authorization"
//)
let session = URLSession.shared
let task = session.dataTask(with: request) { (data, response, error) in
    if let error = error {
        //Handle HTTP request error
    } else if let data = data {
        //Handle HTTP request response
        //print(data)
        let decoder = JSONDecoder()
        if let json = try? decoder.decode(userData.self, from: data) {
            print(json.title)
        }
    } else {
        //Handle unexpected error
    }
}
task.resume()
