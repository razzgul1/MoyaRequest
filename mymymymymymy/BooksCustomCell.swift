
import UIKit

class BooksCustomCell: UITableViewCell {

    var titleLabel = UILabel()
    var authorLabel = UILabel()
    var conditionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        self.addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func cellTapped() {
        if frame.height == 100 {
            UIView.animate(withDuration: 0.2) {
                self.frame.size.height = 50
                self.conditionLabel.alpha = 0
//                self.updateConstraints()
//                self.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.frame.size.height = 100
                self.conditionLabel.alpha = 1
//                self.updateConstraints()
//                self.layoutIfNeeded()
            }
        }
    }
    

    func setupUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false

        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(authorLabel)

        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.font = UIFont.systemFont(ofSize: 16)
        self.contentView.addSubview(conditionLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),

            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),

            conditionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 3),
            conditionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            conditionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            conditionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])
        conditionLabel.alpha = 0
    }

    func configure(with bookTitle: String, author: String, condition: String) {
        titleLabel.text = bookTitle
        authorLabel.text = "by \(author)"
        conditionLabel.text = condition
    }
}


