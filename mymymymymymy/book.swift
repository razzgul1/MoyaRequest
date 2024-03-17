
import Foundation

struct Book: Codable {
    let title: String
    let author: String
    let condition: String

    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case condition
    }
    
}
