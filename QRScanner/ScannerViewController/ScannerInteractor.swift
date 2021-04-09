//
//  ScannerInteractor.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class ScannerInteractor {

    weak var presenter: ScannerInteractorOutputProtocol?

    deinit {
        print("deinit ScannerInteractor")
    }
}

extension ScannerInteractor: ScannerInteractorInputProtocol {
    func scanQRCode() throws {
        
    }
}
