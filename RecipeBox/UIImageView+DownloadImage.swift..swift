//
//  UIImageView+DownloadImage.swift..swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/10/22.
//

import Foundation
import UIKit

extension UIImageView {
  func loadImage(url: URL) -> URLSessionDownloadTask {
    let session = URLSession.shared
    // 1
    let downloadTask = session.downloadTask(with: url) {
      [weak self] url, _, error in
      // 2
      if error == nil, let url = url,
        let data = try? Data(contentsOf: url),   // 3
        let image = UIImage(data: data) {
        // 4
        DispatchQueue.main.async {
          if let weakSelf = self {
            weakSelf.image = image
          }
        }
      }
    }
    // 5
    downloadTask.resume()
    return downloadTask
  }
}
