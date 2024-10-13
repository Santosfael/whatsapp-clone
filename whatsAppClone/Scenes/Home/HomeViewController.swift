//
//  ViewController.swift
//  whatsAppClone
//
//  Created by Rafael on 13/10/24.
//

import UIKit

class HomeViewController: UIViewController {

    private let content = HomeView()

    override func loadView() {
        super.loadView()
        view = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chats"
    }

    override func viewWillAppear(_ animated: Bool) {
        let appearence = UINavigationBarAppearance()

        appearence.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        navigationController?.navigationBar.scrollEdgeAppearance = appearence

        let editIconButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(popupInfo))
        navigationItem.rightBarButtonItem = editIconButton

        let editButton = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = editButton
    }

    @objc private func popupInfo() {
        print("cliquei")
    }
}

