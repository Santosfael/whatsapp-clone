//
//  FilterChatCollectionView.swift
//  whatsAppClone
//
//  Created by Rafael on 21/10/24.
//

import UIKit

final class FilterChatCollectionView: UIView {

    // MARK: - Private Properties
    private let filterOptions: [String] = ["All", "Unread", "Favourites", "Groups"]
    private var selectedFilterItem: Int = 0

    // MARK: - Public Delegate
    public var delegate: FilterChatCollectionViewDelegate?

    // MARK: - Private UI Components
    private lazy var filterChatCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 19, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alpha = 0
        collectionView.isHidden = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    // MARK: - Initializad
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func configureFilterChatCollectionView() {
        filterChatCollectionView.delegate = self
        filterChatCollectionView.dataSource = self
        filterChatCollectionView.register(FilterChatCollectionViewCell.self, forCellWithReuseIdentifier: FilterChatCollectionViewCell.identifier)
    }

    // MARK: - Public Methods
    public func editAlphaCollectionView(alpha: CGFloat) {
        filterChatCollectionView.alpha = alpha

    }

    public func setIsHiddenCollection(isHidden: Bool = true) -> Bool {
        filterChatCollectionView.isHidden = isHidden
        return isHidden
    }
}

// MARK: - Custom Extension
extension FilterChatCollectionView: ViewCode {
    func buildHierachy() {
        addSubview(filterChatCollectionView)
    }

    func setupConstrants() {
        NSLayoutConstraint.activate([
            filterChatCollectionView.topAnchor.constraint(equalTo: topAnchor),
            filterChatCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            filterChatCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterChatCollectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func applyAdditionalChanges() {
        configureFilterChatCollectionView()
    }
}

// MARK: - Extension UICollectionView
extension FilterChatCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterItem = indexPath.item
        delegate?.filterChat(filter: filterOptions[indexPath.row].lowercased())
        collectionView.reloadData()
    }
}

extension FilterChatCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterChatCollectionViewCell.identifier, for: indexPath) as? FilterChatCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(with: filterOptions[indexPath.row])
        
        if selectedFilterItem == indexPath.item {
            cell.setSelectedState(isSelected: true)
        } else {
            cell.setSelectedState(isSelected: false)
        }
        return cell
    }
}

extension FilterChatCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let filterText = filterOptions[indexPath.row]
        let font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        let size = (filterText as String).size(withAttributes: [.font: font])
        return CGSize(width: size.width + 30, height: 35)
    }
}
