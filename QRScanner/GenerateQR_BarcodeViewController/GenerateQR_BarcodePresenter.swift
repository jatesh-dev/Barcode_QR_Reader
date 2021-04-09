//
//  GenerateQR_BarcodePresenter.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GenerateQR_BarcodePresenter {

    weak private var view: GenerateQR_BarcodeViewProtocol?
    var interactor: GenerateQR_BarcodeInteractorInputProtocol?
    private let router: GenerateQR_BarcodeWireframeProtocol

    init(interface: GenerateQR_BarcodeViewProtocol, interactor: GenerateQR_BarcodeInteractorInputProtocol?, router: GenerateQR_BarcodeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    deinit {
        print("deinit GenerateQR_BarcodePresenter")
    }

    func viewDidLoad() {

    }
}

extension GenerateQR_BarcodePresenter: GenerateQR_BarcodePresenterProtocol {
    func GenerateCode(input: String, codeType: Int) {
        interactor?.GenerateCode(input: input, codeType: codeType)
    }
}

extension GenerateQR_BarcodePresenter: GenerateQR_BarcodeInteractorOutputProtocol {
    func getCodeToDisplay(code: UIImage) {
        view?.displayCode(code: code)
    }
}
