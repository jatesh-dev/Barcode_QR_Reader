//
//  ScannerPresenter.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ScannerPresenter {

    weak private var view: ScannerViewProtocol?
    var interactor: ScannerInteractorInputProtocol?
    private let router: ScannerWireframeProtocol

    init(interface: ScannerViewProtocol, interactor: ScannerInteractorInputProtocol?, router: ScannerWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    deinit {
        print("deinit ScannerPresenter")
    }
}

extension ScannerPresenter: ScannerPresenterProtocol {
    func openCamera() {
        
    }
}

extension ScannerPresenter: ScannerInteractorOutputProtocol {
    func getSession() {
        
    }
}
