//
//  OpeningViewController.swift
//  RecipeBox
//
//  Created by Feizza Fazilatun on 5/10/22.
//

import UIKit

class OpeningViewController: UIViewController {

    @IBOutlet weak var basketTop: UIImageView!
    @IBOutlet weak var basketBottom: UIImageView!
    @IBOutlet weak var basketTopConstraint : NSLayoutConstraint!
    @IBOutlet weak var basketBottomConstraint : NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: Animation code and images are from here: https://www.raywenderlich.com/5255-basic-uiview-animation-tutorial-getting-started
    func openBasket() {
        basketTopConstraint.constant -= basketTop.frame.size.height
       basketBottomConstraint.constant -= basketTop.frame.size.height
          
        UIView.animate(withDuration: 1.2, delay: 2.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
          }, completion: { finished in
            print("Basket doors opened!")
          })
    }

    override func viewDidAppear(_ animated: Bool) {
      openBasket()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
