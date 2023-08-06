//
//  UITableViewExampleViewController.swift
//  UITableViewExample
//
//  Created by Minyoung Yoo on 2023/08/06.
//

import UIKit

class UITableViewExampleViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView!
    var safeArea: UILayoutGuide!
    let characters: [String] = ["Link","Zelda","Ganondorf","Impa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    func setupTableView() -> Void{
        tableView = UITableView()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
}

extension UITableViewExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.cellLabel.text = characters[indexPath.row]
        return cell
    }
}

class MyTableViewCell: UITableViewCell {
    
    var cellLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupTableCell() -> Void{
        cellLabel = UILabel()
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
