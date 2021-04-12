//
//  DashboardPresenter.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


final class DashboardPresenter: ScannerViewControllerDelegate, GenerateQR_BarcodeViewControllerDelegate {
    func getCode(code: UIImage) {
        view?.displayOutputFromGenerator(output: code)
    }
    
    func getQRCodeData(data: String) {
        view?.displayOutputFromScanner(data: data)
    }
    

    weak private var view: DashboardViewProtocol?
    var interactor: DashboardInteractorInputProtocol?
    private let router: DashboardWireframeProtocol

    init(interface: DashboardViewProtocol, interactor: DashboardInteractorInputProtocol?, router: DashboardWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    deinit {
        print("deinit DashboardPresenter")
    }
}

extension DashboardPresenter: DashboardPresenterProtocol {
    func navigateToScannerViewController() {
        router.openViewController(controller: ScannerRouter.createModule(delegate: self))
    }
    
    func navigateToGenerateCodeViewController() {
        router.openViewController(controller: GenerateQR_BarcodeRouter.createModule(delegate: self))
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {

}
