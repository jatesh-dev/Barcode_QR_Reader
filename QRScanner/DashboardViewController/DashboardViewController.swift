//
//  BarcodeViewController.swift
//  QRScanner
//
//  Created by Jatesh Kumar on 09/04/2021.
//

import UIKit

class DashboardViewController: UIViewController, ScannerViewControllerDelegate {
    @IBOutlet private var labelResults: UILabel!
    var presenter: DashboardPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit DashboardViewController")
    }
    
    @IBAction private func buttonQRcodeScanner(){
        guard let qrCodeScanner = storyboard?.instantiateViewController(identifier: "ScannerViewController") as? ScannerViewController else { return }
        qrCodeScanner.delegate = self
        navigationController?.pushViewController(qrCodeScanner, animated: true)
    }
    
    @IBAction func buttonCodeGenerator(_ sender: Any) {
        let codeGenerator = GenerateQR_BarcodeRouter.createModule()
        navigationController?.pushViewController(codeGenerator, animated: true)
    }
    func getQRCodeData(data: String) {
        labelResults.text = "Results: \(data)"
    }
}

extension DashboardViewController {
}

extension DashboardViewController: DashboardViewProtocol {
    func showResults() {
        // QR Results loaded here
    }
}
