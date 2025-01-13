//
//  AthleteRegisterTwoViewController.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import UIKit

class AthleteRegisterTwoViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet var mainContainerView: UIView!
    @IBOutlet var navigationBar: CustomNavigationBar!
    @IBOutlet var container: UIView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleOfPage: BoldLabelSize4!
    @IBOutlet var imagePickerView: UIView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var skipButton: CustomButton!
    @IBOutlet var uploadbutton: CustomButton!
    
    //MARK: - PROPERTIES
    var imagePicker = UIImagePickerController()
    var pickedImage: UIImage?
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - HELPERS
    func configureNavigation() {
        let navigationBar = Bundle.main.loadNibNamed("ResuableView", owner: self, options: nil)?.first as? CustomNavigationBar
        if let navigationView = navigationBar {
            navigationView.configureUI(with: Icons.back, tintColor: UIColor.white, notificationImageIcon: nil)
            navigationView.didClickBackButton = {
                self.navigationController?.popViewController(animated: false)
            }
        }
        navigationBar?.backgroundColor = .lightBlackColor
        navigationBar?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        navigationBar?.frame = self.navigationBar.bounds
        self.navigationBar.addSubview(navigationBar!)
    }
    
    func configureUI() {
        mainContainerView.backgroundColor = UIColor.lightBlackColor
        container.backgroundColor = UIColor.blackColor
        container.layer.cornerRadius = Radius.radius2
        skipButton.setTitle("Skip", for: .normal)
        uploadbutton.setTitle("Upload", for: .normal)
        progressBar.progress = 0.3
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
    }
    
    //MARK: - BUTTON ACTION
    @IBAction func pickImageAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func UploadAndContinue(_ sender: Any) {
        if pickedImage == nil {
            self.showToast(message: Titles.selectImage, errorType: .error)
        } else {
            let storyboard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "AthleteRegisterThreeViewController") as! AthleteRegisterThreeViewController
            self.navigationController?.pushViewController(nextVC, animated: false)
        }
    }
    
    @IBAction func SkipButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: StoryboardName.AtheleteRegisterStoryboard, bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "AthleteRegisterThreeViewController") as! AthleteRegisterThreeViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension AthleteRegisterTwoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        pickedImage = image
        profileImageView.image = pickedImage
    }
}
