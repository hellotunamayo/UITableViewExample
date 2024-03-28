//
//  UITableViewExampleViewController.swift
//  UITableViewExample
//
//  Created by Minyoung Yoo on 2024/03/28.
//

import UIKit

struct MockData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
}

class UITableViewExampleViewController: UIViewController {
    
    let tableView: UITableView = {
        let tb: UITableView = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    let mockData: [MockData] = [
        MockData(title: "first data", description: "first description"),
        MockData(title: "second data", description: "second description"),
        MockData(title: "third data", description: "third description"),
        MockData(title: "fourth data", description: "fourth description"),
        MockData(title: "fifth data", description: "fifth description"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mockdata")
        
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            tableView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
}

extension UITableViewExampleViewController: UITableViewDelegate {
    //delegate goes here...
}

extension UITableViewExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mockdata", for: indexPath)
        let data = mockData[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = data.title
        cell.contentConfiguration = content
        return cell
    }
}
