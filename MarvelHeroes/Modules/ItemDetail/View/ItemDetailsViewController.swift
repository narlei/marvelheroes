//
//  ItemDetailsViewController.swift
//  movieFinder
//
//  Created by Narlei A Moreira on 04/08/18.
//  Copyright © 2018 Narlei A Moreira. All rights reserved.
//

import UIKit
import SDWebImage


class ItemDetailsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var constraintImageHeight: NSLayoutConstraint!
    @IBOutlet weak var imageViewCover: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelAdditional: UILabel!
    
    // MARK: Properties
    
    var presenter: ItemDetailsPresentation!
    
    // MARK: Actions
    
    @IBAction func actionButtonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageView(thumb:Thumbnail?) {
        self.imageViewCover.load(thumbnail: thumb, size: .portrait_incredible) { [weak self] (image) in
            guard let imageDownloaded = image, let weakSelf = self else{
                return
            }
            let imageSized = imageDownloaded.resizeImage(newWidth: weakSelf.view.frame.size.width)
            weakSelf.constraintImageHeight.constant = imageSized.size.height
        }
    }
}


extension ItemDetailsViewController: ItemDetailsView {
    
    func showDetails(for comic: Comic){
        self.labelTitle.text = comic.title
        self.labelDescription.text = comic.descriptionField
        self.loadImageView(thumb: comic.thumbnail)
        self.labelAdditional.text = ""
    }
    
    func showDetails(for event: Event){
        self.labelTitle.text = event.title
        self.labelDescription.text = event.descriptionField
        self.loadImageView(thumb: event.thumbnail)
        self.labelAdditional.text = ""
    }
    
    func showDetails(for serie: Serie){
        self.labelTitle.text = serie.title
        self.labelDescription.text = serie.descriptionField
        self.loadImageView(thumb: serie.thumbnail)
        self.labelAdditional.text = ""
    }
    
    func showDetails(for story: Story){
        self.labelTitle.text = story.title
        self.labelDescription.text = story.descriptionField
        self.loadImageView(thumb: story.thumbnail)
        self.labelAdditional.text = ""
    }
    
}
