//
//  GenerateQR_BarcodeViewController.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class GenerateQR_BarcodeViewController: UIViewController {

    @IBOutlet weak var textfieldInput: UITextField!
    @IBOutlet weak var segmentSelectCodeType: UISegmentedControl!
    @IBOutlet weak var buttonGenerateCode: UIButton!
    @IBOutlet weak var imageViewCode: UIImageView!
    
    var presenter: GenerateQR_BarcodePresenterProtocol?
    var index = 0
    var delegate: GenerateQR_BarcodeViewControllerDelegate?
    
    deinit {
        print("deinit GenerateQR_BarcodeViewController")
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func segmentedSelectedCodeType(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
    }
    
    @IBAction func buttonGenerateCode(_ sender: UIButton) {
        presenter?.GenerateCode(input: textfieldInput.text ?? "Default", codeType: index)
    }
}

extension GenerateQR_BarcodeViewController: GenerateQR_BarcodeViewProtocol {
    func displayCode(code: UIImage) {
        imageViewCode.image = code
        delegate?.getCode(code: code)
    }
}

extension GenerateQR_BarcodeViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

protocol GenerateQR_BarcodeViewControllerDelegate {
    func getCode(code: UIImage)
}
