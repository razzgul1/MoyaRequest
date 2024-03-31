import UIKit
import Moya

class BooksViewController: UIViewController {
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var books: [Book] = []
    let provider = MoyaProvider<BooksService>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BooksCustomCell.self, forCellReuseIdentifier: "BooksCustomCell")
        
        view.addSubview(tableView)
        
        fetchBooks()
    }
    
    func fetchBooks() {
        
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
                    
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.tableView.performBatchUpdates(nil)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "BooksCustomCell") as? BooksCustomCell
        else {
            return UITableViewCell()
        }
        let book = books[indexPath.row]
        cell.configure(with: book.title, author: book.author, condition: book.condition)
        return cell
    }
}

