//
//  AppleGalleryViewController.swift
//  apple-gallery
//
//  Created by Anna Sumire on 28.02.24.
//

import UIKit

final class AppleGalleryViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: AppleGalleryViewModel
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupNavigationBar()
        setupSubviews()
        setupConstraints()
        setupTableView()
        setViewModelDelegate()
    }
    
    init(viewModel: AppleGalleryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Apple Gallery"
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AppleItemTableViewCell.self, forCellReuseIdentifier: "itemCell")
    }
    
    private func setViewModelDelegate() {
        viewModel.delegate = self
    }
}

// MARK: - TableView DataSource
extension AppleGalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.results[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? AppleItemTableViewCell {
            cell.configure(with: item)
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - TableView Delegate
extension AppleGalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appleDetailsViewController = AppleDetailsViewController()
        appleDetailsViewController.configure(with: viewModel.results[indexPath.row])
        navigationController?.pushViewController(appleDetailsViewController, animated: true)
    }
}

// MARK: - GalleryViewModelDelegate
extension AppleGalleryViewController: AppleGalleryViewModelDelegate {
    func didFetchData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
