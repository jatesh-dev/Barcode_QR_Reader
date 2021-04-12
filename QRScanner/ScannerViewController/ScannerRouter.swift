//
//  ScannerRouter.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Hasnain Kanji
//

import UIKit

final class ScannerRouter {

    weak var viewController: UIViewController?

    deinit {
        print("deinit ScannerRouter")
    }

    static func createModule(delegate: ScannerViewControllerDelegate) -> UIViewController {

        // Change to get view from storyboard if not using progammatic UI
        let view = scannerViewController.instantiateViewController(identifier: "ScannerViewController") as? ScannerViewController
        let interactor = ScannerInteractor()
        let router = ScannerRouter()
        let presenter = ScannerPresenter(interface: view!, interactor: interactor, router: router)

        view!.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        view!.delegate = delegate.self
        
        return view!
    }
    
    static var scannerViewController: UIStoryboard{return UIStoryboard(name: "Main", bundle: Bundle.main)}
}

extension ScannerRouter: ScannerWireframeProtocol {
    func navigateToViewController(controller: UIViewController) {
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
