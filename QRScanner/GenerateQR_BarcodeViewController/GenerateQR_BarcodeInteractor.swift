//
//  GenerateQR_BarcodeInteractor.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GenerateQR_BarcodeInteractor {
    var filter: CIFilter!
    weak var presenter: GenerateQR_BarcodeInteractorOutputProtocol?

    deinit {
        print("deinit GenerateQR_BarcodeInteractor")
    }
}

extension GenerateQR_BarcodeInteractor: GenerateQR_BarcodeInteractorInputProtocol {
    func GenerateCode(input: String, codeType: Int) {
        let data = input.data(using: .ascii, allowLossyConversion: false)
        if codeType == 0 {
            filter = CIFilter(name: "CICode128BarcodeGenerator")
        } else {
            filter = CIFilter(name: "CIQRCodeGenerator")
        }
        filter.setValue(data, forKey: "inputMessage")
        if let filteredImage = filter.outputImage {
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = UIImage(ciImage: filteredImage.transformed(by: transform))
            presenter?.getCodeToDisplay(code: image)
        }
    }
}
