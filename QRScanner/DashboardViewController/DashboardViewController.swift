//
//  BarcodeViewController.swift
//  QRScanner
//
//  Created by Jatesh Kumar on 09/04/2021.
//

import UIKit

class DashboardViewController: UIViewController{
    @IBOutlet private var labelResults: UILabel!
    var presenter: DashboardPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit DashboardViewController")
    }
    
    @IBAction private func buttonQRcodeScanner(){
        presenter?.navigateToScannerViewController()
//        let qrCodeScanner = ScannerRouter.createModule(delegate: self)
//        navigationController?.pushViewController(qrCodeScanner, animated: true)
    }
    
    @IBAction func buttonCodeGenerator(_ sender: Any) {
        let codeGenerator = GenerateQR_BarcodeRouter.createModule()
        navigationController?.pushViewController(codeGenerator, animated: true)
    }
    
}

extension DashboardViewController {
}

extension DashboardViewController: DashboardViewProtocol {
    func displayOutputFromScanner(data: String) {
        self.labelResults.text = data
    }
    
    func showResults() {
        // QR Results loaded here
    }
}
