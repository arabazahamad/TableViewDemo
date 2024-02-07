//
//  ContentView.swift
//  TableViewDemo
//
//  Created by Apps WeLove on 15/12/23.
//

import SwiftUI
import UIKit

struct TableViewWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UITableViewController

    func makeUIViewController(context: Context) -> UITableViewController {
        let tableViewController = UITableViewController()
        tableViewController.tableView.delegate = context.coordinator
        tableViewController.tableView.dataSource = context.coordinator
        //tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // Additional setup for the table view
        tableViewController.tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        return tableViewController
    }
    

    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        // Update the view controller when SwiftUI state changes
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: TableViewWrapper
        let cellIdentifier = "CustomCell"

        init(_ parent: TableViewWrapper) {
            self.parent = parent
        }

        // Implement UITableViewDelegate and UITableViewDataSource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Return the number of rows
            return 5
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create and configure the cell
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomCell
           cell?.myImageView.image = UIImage(named: "car")
            
            cell?.myLabel.text = "Price 000\(indexPath.row)"

            return cell ?? UITableViewCell()

        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200.0
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath)
        }
    }
}

struct TableViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        TableViewWrapper()
    }
}
struct ContentView: View {
    var body: some View {
        // Use TableViewWrapper in your content view
        TableViewWrapper()
    }
}
