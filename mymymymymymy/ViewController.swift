
import UIKit
import Moya
class ViewController: UIViewController {
    
    
    
    let provider = MoyaProvider<BooksService>()
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        provider.request(.getBooks) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try response.map(ResponseData.self)
                    let booksResponse = data.hydraMember
                    self.books = booksResponse
                    DispatchQueue.main.async {
                        
                        for book in self.books {
                            print(book.title, book.author)
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
