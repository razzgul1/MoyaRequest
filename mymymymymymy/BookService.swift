
import Foundation
import Moya

enum BooksService {
    case getBooks
}

extension BooksService: TargetType {
    var baseURL: URL {
        return URL(string: "https://demo.api-platform.com")!
    }
    
    var path: String {
        switch self {
        case .getBooks:
            return "/books"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBooks:
            return .get
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
