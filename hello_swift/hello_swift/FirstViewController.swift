import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var navigationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationButton.addTarget(self,
                                   action: #selector(navigationButtonDidTap),
                                   for: .touchUpInside)
        navigationItem.title = "Hamazon App"
        
    }
    
    @objc func navigationButtonDidTap() {
        print("navigationButtonDidTap")
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
      
    }

}
