//
//  UIImage+extensions.swift
//  whatsAppClone
//
//  Created by Rafael on 16/10/24.
//

import UIKit

extension UIImage {

    // MARK: - Static Methods
    /// Rederiza a imagem em um tamanho menor relacionado a view do contexto
    static func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else { return nil }
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Define o novo tamanho que mantém o aspecto
        let newSize = CGSize(width: size.width * min(widthRatio, heightRatio),
                             height: size.height * min(widthRatio, heightRatio))

        // Renderiza a nova imagem
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
