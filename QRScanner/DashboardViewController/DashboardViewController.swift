//
//  BarcodeViewController.swift
//  QRScanner
//
//  Created by Jatesh Kumar on 09/04/2021.
//

import UIKit

class DashboardViewController: UIViewController{
    @IBOutlet private var labelResults: UILabel!
    @IBOutlet weak var imageViewCode: UIImageView!
    var presenter: DashboardPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewCode.isHidden = true
    }
    
    deinit {
        print("deinit DashboardViewController")
    }
    
    @IBAction private func buttonQRcodeScanner(){
        labelResults.text = ""
        imageViewCode.image = nil
        presenter?.navigateToScannerViewController()
    }
    
    @IBAction func buttonCodeGenerator(_ sender: Any) {
        labelResults.text = ""
        imageViewCode.image = nil
        presenter?.navigateToGenerateCodeViewController()
    }
}

extension DashboardViewController: DashboardViewProtocol {
    func displayOutputFromGenerator(output: UIImage) {
        self.imageViewCode.image = output
        self.imageViewCode.isHidden = false
    }
    
    func displayOutputFromScanner(data: String) {
        self.labelResults.text = data
    }
}
