//
//  ViewController.swift
//  JobTracker
//
//  Created by Thong Hoang Nguyen on 2019-05-14.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit
import CoreData

class CompaniesTableViewController: UITableViewController, AddCompanyControllerDelegate{
    
    //MARK: - Properties
    var companies = [Company]()
    
    //MARK: - constants
    private let reuseID = "companyCell"
    
    //MARK: - Life cycle mothods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "Companies"
        tableView.separatorColor = .darkGray
        tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: reuseID)
        setupRightAddButton()
        fetchCompanies()
    }
    //MARK: - Tableview data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! CompanyTableViewCell
        cell.company = companies[indexPath.row]
        return cell
    }
    
    //MARK: - helper mothods
    private func setupRightAddButton() {
        let addButt = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(navigateAddCompany))
        addButt.tintColor = .white
        navigationItem.rightBarButtonItem = addButt
    }
    @objc func navigateAddCompany() {
        let addVC = AddCompanyViewController()
        addVC.delegate = self
        let addNVC = LightStatusBarNavigationController(rootViewController: addVC)
        present(addNVC, animated: true, completion: nil)
        
    }
    //MARK: - add company view controller delegate
    func addCompanyDidFinish(company: Company) {
        companies.append(company)
        let insertPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [insertPath], with: .automatic)
    }
    
    func addCompanyDidCancel() {
        
    }
    func editCompanyDidFinish(company: Company) {
        let row = companies.firstIndex(of: company)
        tableView.reloadRows(at: [IndexPath(row: row!, section: 0)], with: .middle)
    }
    private func fetchCompanies() {
        // NSManagedObjectContext: scratch pad
        // - viewContext: ManagedObjectContext (main thread)
        let managedContext = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies =  try managedContext.fetch(fetchRequest)
            self.companies = companies
            tableView.reloadData()
        } catch let err {
            print("Failed to fetch companies: \(err)")
        }
    }
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Delete action
        let company = companies[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.companies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            let managedContext = CoreDataManager.shared.persistentContainer.viewContext
            managedContext.delete(company)
            CoreDataManager.shared.saveContext()
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let editVC = AddCompanyViewController()
            editVC.delegate = self
            editVC.company = company
            let editNVC = LightStatusBarNavigationController(rootViewController: editVC)
            self.present(editNVC, animated: true, completion: nil)
        }
        // Edit action
        return [deleteAction, editAction]
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Start looking for a job..."
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .boldSystemFont(ofSize: 20)
        return descriptionLabel
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if companies.count == 0 {
            return view.frame.height
        }
        return 0
    }
}

