//
//  TableViewController.swift
//  DemoCaptureImage
//
//  Created by Ngoc on 8/6/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController ,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        return cell
    }
    
    
    @IBAction func onClickButon(_ sender: Any) {
        showActionSheet()
    }
    
    func showActionSheet() {
        let menuOption = UIAlertController(title: nil, message: "Click choose image", preferredStyle: .actionSheet)
        
        let libraryAction = UIAlertAction(title: "Library", style: .default) { (_) in
            self.openLibrary()
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.openCamera()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        menuOption.addAction(libraryAction)
        menuOption.addAction(cameraAction)
        menuOption.addAction(cancelAction)
        
        present(menuOption, animated: true, completion: nil)
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func openLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "123"), object: image)
        dismiss(animated: true, completion: nil)
    }
    
}
