import UIKit

class DetailViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var contentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var stackView:UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 10
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var imageView:UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return i
    }()
    
    var viewModel:DetailViewModel?
    
    init(viewModel:DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        
        addSubviews()
        setupConstraints()
        setupView()
    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationItem.largeTitleDisplayMode = .never
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateAll(views: stackView.arrangedSubviews.filter {$0 is UILabel}, interval: 0.00)
    }
    
    private func addSubviews(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
    }
    
    func makeTitleLabel(with text:String?) -> UILabel {
        let label = UILabel()
        label.text = text!.isEmpty ? "-" : text
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.alpha = 0
        return label
    }
    
    func makeSubtitleLabel(with text:String?) -> UILabel {
        let label = UILabel()
        label.text = text!.isEmpty ? "-" : text
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.alpha = 0
        return label
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let contentHeightConstraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        contentHeightConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            contentHeightConstraint
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10 ),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupView(){
        guard let model = self.viewModel?.model else { return }
        stackView.addArrangedSubview(makeTitleLabel(with: model.name))
        imageView.load(from: URL(string: model.image!)!)
        stackView.addArrangedSubview(makeTitleLabel(with: "Last known location"))
        stackView.addArrangedSubview(makeSubtitleLabel(with: model.location?.name))
        stackView.addArrangedSubview(makeTitleLabel(with: "First seen in"))
        stackView.addArrangedSubview(makeSubtitleLabel(with: model.origin?.name))
        stackView.addArrangedSubview(makeTitleLabel(with: "Status"))
        stackView.addArrangedSubview(makeSubtitleLabel(with: model.status))
        
    }
    
    func animateAll(views:[UIView], interval:Double) {
        
        for (index, view) in views.enumerated() {
            UIView.animate(withDuration: interval, delay: interval * Double(index), options: [.transitionCrossDissolve, .curveEaseOut], animations: {
                view.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                view.alpha = 1.0
            }) { _ in
                UIView.animate(withDuration: interval) {
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        }
    }
}
