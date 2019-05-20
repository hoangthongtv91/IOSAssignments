//
//  AddCompanyViewController.swift
//  JobTracker
//
//  Created by Thong Hoang Nguyen on 2019-05-14.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit
import CoreData
protocol AddCompanyControllerDelegate: class {
    func addCompanyDidFinish(company: Company)
    func addCompanyDidCancel()
    func editCompanyDidFinish(company: Company)
}

class AddCompanyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    weak var delegate: AddCompanyControllerDelegate?
    var company: Company? {
        didSet {
            nameTextField.text = company?.name
            guard let applied = company?.applied else { return }
            datePicker.date = applied
            if let imageData = company?.imageData {
                companyImageView.image = UIImage(data: imageData)
            }
        }
    }
    lazy var companyImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 50
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "addImage")
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        return iv
    }()
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Company name: "
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .white
        return lb
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter company's name here..."
        tf.textColor = .white
        return tf
    }()
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.backgroundColor = .white
        dp.datePickerMode = .date
        dp.layer.cornerRadius = 16
        dp.clipsToBounds = true
        return dp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "Add Company"
        setupNavigation()
        setupUI()
    }
    @objc func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
    @objc func savePressed() {
        //NSPersistentContainer: database
        //initialization of out core data stack
        //NSManagedObjectContext: scratch pad
        // - viewContext: ManagedObjectContext (main thread)
        if company == nil {
            let managedContext = CoreDataManager.shared.persistentContainer.viewContext
            let newCompany = NSEntityDescription.insertNewObject(forEntityName: "Company", into: managedContext)
            newCompany.setValue(nameTextField.text ?? "", forKey: "name")
            newCompany.setValue(datePicker.date, forKey: "applied")
            if let newCompanyImage = companyImageView.image {
                let imageData = newCompanyImage.jpegData(compressionQuality: 1.0)
                newCompany.setValue(imageData, forKey: "imageData")
            }
            delegate?.addCompanyDidFinish(company: newCompany as! Company)
        } else {
            company?.name = nameTextField.text
            company?.applied = datePicker.date
            if let newCompanyImage = companyImageView.image {
                let imageData = newCompanyImage.jpegData(compressionQuality: 1.0)
                company?.imageData = imageData
            }
            delegate?.editCompanyDidFinish(company: company!)
        }
        CoreDataManager.shared.saveContext()
        dismiss(animated: true, completion: nil)
    }
    private func setupNavigation() {
        let cancelButt = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
        cancelButt.tintColor = .white
        let saveButt = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(savePressed))
        saveButt.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButt
        navigationItem.rightBarButtonItem = saveButt
    }
    private func setupUI() {
        view.addSubview(companyImageView)
        NSLayoutConstraint.activate([
            companyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            companyImageView.heightAnchor.constraint(equalToConstant: 100),
            companyImageView.widthAnchor.constraint(equalToConstant: 100),
            companyImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        let horizontalStackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            horizontalStackView.topAnchor.constraint(equalTo: companyImageView.bottomAnchor, constant: 32)
        ])
        view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 16),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            datePicker.heightAnchor.constraint(equalToConstant: 150)
        ])
        
    }
    @objc func selectImage() {
        print("select a photo")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
        imagePickerController.allowsEditing = true
    }
    //MARK: - UIImagePicker Controller Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            companyImageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            companyImageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}
