//
//  ScannerViewController.swift
//  QRScanner
//
//  Created Jatesh Kumar on 09/04/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import AVKit

protocol ScannerViewControllerDelegate {
    func getQRCodeData(data: String)
}

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

	var presenter: ScannerPresenterProtocol?
    
    @IBOutlet weak var viewVideo: UIView!
    var delegate: ScannerViewControllerDelegate?
    enum error : Error {
        case noCameraAvailable
        case videoInputInitFail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try scanQRCode()
        } catch {
            print("Failed")
        }
    }
    
    deinit {
        print("deinit ScannerViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            guard let machineReadableCode = metadataObjects [0] as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringResult = machineReadableCode.stringValue else { return }
            if machineReadableCode.type == AVMetadataObject.ObjectType.qr {
                print(stringResult.description)
                delegate?.getQRCodeData(data: stringResult.description)
                navigationController?.popViewController(animated: true)
                guard let url = URL(string: stringResult.decomposedStringWithCanonicalMapping) else { return }
                UIApplication.shared.open(url)
            }
            else {
                delegate?.getQRCodeData(data: stringResult.description)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func scanQRCode () throws {
        let avCaptureSession = AVCaptureSession()
        guard let avCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            print("No Camera")
            throw error.noCameraAvailable
        }
        
        guard let avCaptureInput = try? AVCaptureDeviceInput(device: avCaptureDevice) else {
            print("Camera failed to init")
            throw error.videoInputInitFail
        }
        
        let avCaptureMetadataOutput = AVCaptureMetadataOutput()
        avCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        avCaptureSession.addInput(avCaptureInput)
        avCaptureSession.addOutput(avCaptureMetadataOutput)
        
        avCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr, AVMetadataObject.ObjectType.code128, AVMetadataObject.ObjectType.code39, AVMetadataObject.ObjectType.code93, AVMetadataObject.ObjectType.code39Mod43, AVMetadataObject.ObjectType.dataMatrix, AVMetadataObject.ObjectType.aztec, AVMetadataObject.ObjectType.dataMatrix, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.interleaved2of5, AVMetadataObject.ObjectType.pdf417, AVMetadataObject.ObjectType.itf14, AVMetadataObject.ObjectType.upce]
        
        let avCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: avCaptureSession)
        avCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avCaptureVideoPreviewLayer.frame = self.viewVideo.bounds
        self.viewVideo.layer.addSublayer(avCaptureVideoPreviewLayer)
        
        avCaptureSession.startRunning()
    }
}

extension ScannerViewController: ScannerViewProtocol {

}
