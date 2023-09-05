//
//  Extension.swift
//  ChatApp
//
//  Created by Taha Turan on 2.09.2023.
//

import UIKit

extension UIViewController {
    ///Adds a gradient layer to a view. // Görünüme bir gradient katmanı ekler.
    ///
    /// - Parameters:
    ///   - view: The view to which the gradient layer will be added. // Gradient katmanının ekleneceği görünüm.
    ///   - colors: The list of colors to be used in the gradient. // Gradientte kullanılacak renklerin listesi.
    ///   - locations: The distribution of colors in the gradient. // Gradientin renklerinin dağılımı.
    func addGradientLayer(to view: UIView, colors: [UIColor] = K.Colors.colorgradiendList, locations: [NSNumber] = K.Colors.colorGradiendLocations) {
        let gradient = CAGradientLayer()
        gradient.locations = locations
        
        // Gradient renklerini belirlemek için UIColor dizisini CGColor dizisine dönüştürür.
        // This line converts the UIColor array to a CGColor array to specify gradient colors.
        gradient.colors = colors.map { $0.cgColor }

        // Gradient katmanının boyutunu, görüntülenen UIView nesnesinin boyutuna ayarlar.
        // The size of the gradient layer is set to match the dimensions of the displayed UIView.
        gradient.frame = view.bounds

        // Gradient katmanını UIView nesnesinin altına ekler. 0, katmanın en altta olacağı anlamına gelir.
        // This line adds the gradient layer beneath the UIView, with 0 indicating it will be at the very bottom.
        view.layer.insertSublayer(gradient, at: 0)

    }

}
