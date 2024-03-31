import UIKit

class BooksCustomCell: UITableViewCell {
    
    var containerView = UIStackView()
    var titleLabel = UILabel()
    var authorLabel = UILabel()
    var conditionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with bookTitle: String, author: String, condition: String) {
        titleLabel.text = bookTitle
        authorLabel.text = "by \(author)"
        conditionLabel.text = condition
    }
    
    func commonInit() {
        selectionStyle = .none
        conditionLabel.isHidden = true
        
        containerView.axis = .vertical
        
        contentView.addSubview(containerView)
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(authorLabel)
        containerView.addArrangedSubview(conditionLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 16).isActive = true
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    
    var isConditionLabelHidden:Bool {
        return conditionLabel.isHidden
    }
    
    func showConditionLabel() {
        conditionLabel.isHidden = false
        
    }
    func hideConditionLabel() {
        conditionLabel.isHidden = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isConditionLabelHidden, selected {
            showConditionLabel()
        } else {
            hideConditionLabel()
        }
    }
}

    
    
    
    
