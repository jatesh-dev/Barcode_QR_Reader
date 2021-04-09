//
//  DashboardPresenter.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


final class DashboardPresenter {

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

    func viewDidLoad() {

    }
}

extension DashboardPresenter: DashboardPresenterProtocol {
    func openScannerView() {
        
    }
    func openModule(controller: UIViewController){
        
    }
}

extension DashboardPresenter: DashboardInteractorOutputProtocol {

}
