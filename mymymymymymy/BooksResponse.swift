
import Foundation

struct ResponseData: Codable {
    let hydraMember: [Book]
    
    enum CodingKeys: String, CodingKey {
        case hydraMember = "hydra:member"
    }
}

