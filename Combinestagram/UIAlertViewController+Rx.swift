//
//  UIAlertViewController+Rx.swift
//  Combinestagram
//
//  Created by Natalia Kazakova on 11/10/2019.
//  Copyright © 2019 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
  func alert(_ title: String, description: String? = nil) -> Completable {
    return Completable.create { [weak self] completable in
      let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
      alert.addAction(
        UIAlertAction(title: "Close", style: .default, handler: { _ in
          completable(.completed)
        })
      )
      self?.present(alert, animated: true, completion: nil)
      return Disposables.create {
        self?.dismiss(animated: true, completion: nil)
      }
    }
  }
}
