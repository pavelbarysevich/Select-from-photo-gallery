//
//  ViewController.swift
//  Select from photo gallery
//
//  Created by Павел Борисевич on 1.06.21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, AVPlayerViewControllerDelegate {
    @IBOutlet weak var imageViewFill: UIImageView!
    let imagePicer = UIImagePickerController()
    let playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //actionButtonImage
    @IBAction func actionButtonImage(_ sender: Any) {
        imagePicer.delegate = self
        imagePicer.sourceType = .photoLibrary
        
        present(imagePicer, animated: true, completion: nil)
    }
    // actionButtonVideo
    @IBAction func actionButtonVideo(_ sender: Any) {
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Apple", ofType: "mp4") ?? ""))
        
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        playerController.delegate = self
        playerController.player?.play()
        present(playerController, animated: true, completion: nil)
    }
    
}

//MARK: Delegate - actionButtonImage
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        imageViewFill.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}


