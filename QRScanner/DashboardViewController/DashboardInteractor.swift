//
//  DashboardInteractor.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class DashboardInteractor {

    weak var presenter: DashboardInteractorOutputProtocol?

    deinit {
        print("deinit DashboardInteractor")
    }
}

extension DashboardInteractor: DashboardInteractorInputProtocol {

}
