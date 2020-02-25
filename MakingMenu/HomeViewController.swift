//
//  ViewController.swift
//  MakingMenu
//
//  Created by Murat Bekgi on 2/18/20.
//  Copyright © 2020 Murat Bekgi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let transiton = SlideInTransition()
    var topView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
    guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
                menuViewController.didTapMenuType = { menuType in
                    self.transitionToNew(menuType)
                }
                menuViewController.modalPresentationStyle = .overCurrentContext
                menuViewController.transitioningDelegate = self
                present(menuViewController, animated: true)
            }

            func transitionToNew(_ menuType: MenuType) {
                let title = String(describing: menuType).capitalized
                self.title = title

                topView?.removeFromSuperview()
                switch menuType {
                case .profile:
                    let view = UIView()
                    view.backgroundColor = .yellow
                    view.frame = self.view.bounds
                    self.view.addSubview(view)
                    self.topView = view
                case .about:
                    let view = UIView()
                    view.backgroundColor = .blue
                    view.frame = self.view.bounds
                    self.view.addSubview(view)
                    self.topView = view
                default:
                    break
                }
            }

        }

        extension HomeViewController: UIViewControllerTransitioningDelegate {
            func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transiton.isPresenting = true
                return transiton
            }

            func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
                transiton.isPresenting = false
                return transiton
            }
        }

