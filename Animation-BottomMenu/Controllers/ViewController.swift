//
//  ViewController.swift
//  Animation-BottomMenu
//
//  Created by khaled saad on 12/31/19.
//  Copyright © 2019 khaled saad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: outlets
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var darkView: UIView!
    @IBOutlet weak var toggelButton: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var bottomBtn2: UIButton!
    @IBOutlet weak var bottomBtn3: UIButton!
    @IBOutlet weak var bottomBtn4: UIButton!
    @IBOutlet weak var tFWidth: NSLayoutConstraint!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var pickedImage: UIImageView!
    
    //MARK: Variables
    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        bottomBtn.alpha = 0
        bottomBtn2.alpha = 0
        bottomBtn3.alpha = 0
        bottomBtn4.alpha = 0
    }
    
    @IBAction func toggelBtnClicked(_ sender: Any) {
        
        if self.darkView.transform == .identity {
            
            UIView.animate(withDuration: 0.4, animations: {
                self.darkView.transform = CGAffineTransform(scaleX: 20, y: 20)
                self.toggelButton.transform = CGAffineTransform(rotationAngle: self.rotateButton(degree: 180))
                self.bottomView.transform = CGAffineTransform(translationX: 0, y: -66)
            }) { (done) in
                UIView.animate(withDuration: 0.2) {
                    self.setAlphaForButtons()
                }
            }
        } else {

            UIView.animate(withDuration: 0.2, animations: {
                self.setAlphaForButtons()

            }) { (dona) in
                UIView.animate(withDuration: 0.4) {
                    self.darkView.transform = .identity
                    self.toggelButton.transform = .identity
                    self.bottomView.transform = .identity
                }
            }
            
        }
    }
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        
        if tFWidth.constant == 50 {
            tFWidth.constant = 300
        } else {
            tFWidth.constant = 50
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        }) { (done) in
            self.searchTF.resignFirstResponder()
        }
    }
    
    @IBAction func pickImageBtnClicked(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let nextView = storybord.instantiateViewController(identifier: "NextViewController") as! NextViewController
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
    func rotateButton(degree: Double) -> CGFloat {
        return CGFloat(degree * .pi / degree)
    }
    
    func setAlphaForButtons() {
        let alpha = CGFloat(bottomBtn.alpha == 0 ? 1 : 0)
        bottomBtn.alpha = alpha
        bottomBtn2.alpha = alpha
        bottomBtn3.alpha = alpha
        bottomBtn4.alpha = alpha
    }
    
    func ConvertImageToBase64String (img: UIImage) -> String {
        print("\(img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? "")")
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.pickedImage.image = image
        self.ConvertImageToBase64String(img: image!)
    }
}
