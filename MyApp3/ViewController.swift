//
//  ViewController.swift
//  MyApp3
//
//  Created by Jinwoo Kim on 5/24/24.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate {
    @IBOutlet @ViewLoading var pinkView: UIView
    @IBOutlet @ViewLoading var cyanView: UIView
    @IBOutlet @ViewLoading var greenView: UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contextMenuInteraction: UIContextMenuInteraction = .init(delegate: self)
        view.addInteraction(contextMenuInteraction)
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        // set_internalSecondaryItemIdentifiers:
        
        let identifier: String?
        let secondaryItemIdentifiers: [String]
        let hitTestingView: UIView? = view.hitTest(location, with: nil)
        
        if hitTestingView == pinkView {
            identifier = "1"
            secondaryItemIdentifiers = ["2", "3"]
        } else if hitTestingView == cyanView {
            identifier = "2"
            secondaryItemIdentifiers = ["1", "3"]
        } else if hitTestingView == greenView {
            identifier = "3"
            secondaryItemIdentifiers = ["1", "2"]
        } else {
            return nil
        }
        
        let contextMenuConfiguration: UIContextMenuConfiguration = .init(
            identifier: identifier as NSString?,
            previewProvider: nil, 
            actionProvider: { suggestedActions in
                let firstAction: UIAction = .init(title: "Test") { _ in
                    
                }
                return .init(children: [firstAction])
            }
        )
        
        contextMenuConfiguration.secondaryItemIdentifiers = .init(secondaryItemIdentifiers)
        
        return contextMenuConfiguration
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configuration: UIContextMenuConfiguration, highlightPreviewForItemWithIdentifier identifier: any NSCopying) -> UITargetedPreview? {
        guard let identifier: String = identifier as? String else { return nil }
        
        if identifier == "1" {
            return .init(view: pinkView)
        } else if identifier == "2" {
            return .init(view: cyanView)
        } else if identifier == "3" {
            return .init(view: greenView)
        } else {
            return nil
        }
    }
}

