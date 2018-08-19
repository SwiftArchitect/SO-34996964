//
//  TableViewController.swift
//  SO-34996964
//
//  Copyright © 2017, 2018 Xavier Schott
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class TableViewController: UITableViewController {

    var cacheSelectedRows:[IndexPath]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if let textLabel = cell.textLabel {
            textLabel.backgroundColor = UIColor.clear

            textLabel.numberOfLines = 1
            if let cacheSelectedRows = cacheSelectedRows {
                textLabel.numberOfLines = (cacheSelectedRows.contains(indexPath)) ? 0 : 1
            }
            textLabel.text = "\(1 + indexPath.row), Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.reloadRowsAtIndexPaths(tableView, indexPath:indexPath)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.reloadRowsAtIndexPaths(tableView, indexPath:indexPath)
    }

    func reloadRowsAtIndexPaths(_ tableView: UITableView, indexPath: IndexPath) {
        cacheSelectedRows = tableView.indexPathsForSelectedRows

        tableView.reloadRows(at: [indexPath], with: .fade)

        // Restore selection
        if let cacheSelectedRows = cacheSelectedRows {
            for path in cacheSelectedRows {
                self.tableView.selectRow(at: path, animated: false, scrollPosition: .none)
            }
        }
    }
}
