//
//  MatchViewController.swift
//  lindr
//
//  Created by Jamie Walker on 4/07/21.
//

import UIKit
import Cartography

class MatchViewController: BaseViewController {
    
    private let viewModel: MatchViewModel
    
    private let mainStackView = UIStackView()
    private lazy var keepBrowsingButton = UIButton(type: .custom)
    private lazy var sayHelloButton = UIButton(type: .custom)
    private let matchTextImageView = UIImageView()
    private let matchOverlayImageView = UIImageView()
    
    init(viewModel: MatchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder?) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        setupMainView()
        applyAnimateOutTransforms()
    }
    
    private func setupMainView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 10
        
        mainStackView.addArrangedSubview(matchOverlayImageView)
        mainStackView.addArrangedSubview(matchTextImageView)
        mainStackView.addArrangedSubview(sayHelloButton)
        mainStackView.addArrangedSubview(keepBrowsingButton)
        
        matchOverlayImageView.contentMode = .scaleAspectFit
        matchTextImageView.contentMode = .scaleAspectFit
        sayHelloButton.imageView?.contentMode = .scaleAspectFit
        keepBrowsingButton.imageView?.contentMode = .scaleAspectFit
        
        matchOverlayImageView.image = Resources.matchOverlay
        matchTextImageView.image = Resources.itsAMatch
        sayHelloButton.setImage(Resources.sayHello, for: .normal)
        keepBrowsingButton.setImage(Resources.keepBrowsing, for: .normal)
        
        constrain(mainStackView,
                  view,
                  matchOverlayImageView,
                  matchTextImageView,
                  sayHelloButton,
                  keepBrowsingButton) { (mainStackView,
                                         view,
                                         matchOverlayImageView,
                                         matchTextImageView,
                                         sayHelloButton,
                                         keepBrowsingButton) in
            mainStackView.center == view.center
            mainStackView.size == view.safeAreaLayoutGuide.size * 0.9
            keepBrowsingButton.height == 50
            sayHelloButton.height == keepBrowsingButton.height
            matchTextImageView.height == mainStackView.height * 0.2
            
        }
    }
    
    private func setupBindings() {
        sayHelloButton.addTarget(self, action: #selector(sayHelloTapped), for: .touchUpInside)
        keepBrowsingButton.addTarget(self, action: #selector(keepBrowsingTapped), for: .touchUpInside)
    }
    
    @objc private func sayHelloTapped() {
        viewModel.handleSayHello()
    }
    
    @objc private func keepBrowsingTapped() {
        viewModel.handleKeepBrowsing()
    }
    
    func animateIn(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.5, animations: {
            self.whiteView.alpha = 0
            self.sayHelloButton.transform = .identity
            self.keepBrowsingButton.transform = .identity
            self.matchOverlayImageView.transform = .identity
            self.matchTextImageView.transform = .identity
        }, completion: completion)
    }
    
    func animateOut(completion: @escaping (Bool) -> () = { _ in }) {
        UIView.animate(withDuration: 0.5, animations: {
            self.whiteView.alpha = 1
            self.applyAnimateOutTransforms()
        }, completion: completion)
    }
    
    private func applyAnimateOutTransforms() {
        sayHelloButton.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
        keepBrowsingButton.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
        matchOverlayImageView.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height)
        matchTextImageView.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
    }
    
}

fileprivate struct Resources {
    
    static let itsAMatch = #imageLiteral(resourceName: "ItsAMatch")
    static let keepBrowsing = #imageLiteral(resourceName: "KeepBrowsing")
    static let sayHello = #imageLiteral(resourceName: "MessageButton")
    static let matchOverlay = #imageLiteral(resourceName: "MatchOverlay")
    
}
