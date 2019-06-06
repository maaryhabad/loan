//
//  TodosTableViewController.swift
//  Loan
//
//  Created by Mariana Beilune Abad on 05/06/19.
//  Copyright © 2019 Mariana Beilune Abad. All rights reserved.
//

import UIKit


class TodosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Section {
        let letter : String
        let livros : [Livro]
    }
    
    let arrayLivros = Model.instance.livros
    var arrayNomes = [String]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        //pegaNomeLivros()
//        print(arrayNomes)
        let groupedDictionary = Dictionary(grouping: arrayLivros, by: {String($0.nome.prefix(1))})
        let keys = groupedDictionary.keys.sorted()
        sections = keys.map {Section(letter: $0, livros: groupedDictionary[$0]!)}
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].letter
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sections[section].livros.count
        // return arrayLivros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let section = sections[indexPath.section]
        print(section)
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableViewCell
        
        tableCell.displayLivro(arrayNomes: section.livros[indexPath.row].nome)

        return tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "livro") as? LivroViewController {
            vc.livroSelecionado = sections[indexPath.section].livros[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
