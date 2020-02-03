import UIKit

class ViewController: UIViewController {
    
    private var mainView = MainView()
    
    private var users = [User]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Users"
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.collectionView.register(UINib(nibName: "RandomPersonCell", bundle: nil), forCellWithReuseIdentifier: "randomPodcastCell")
        
    }
    override func loadView() {
        view = mainView
    }
    
    private func getUsers() {
        UsersFetchingService.manager.getUsers(completionHandler: { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error", message: "Couldn't load user data: \(appError)")
                }
            case .success(let users):
                self?.users = users
            }
        }
        )
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "randomPersonCell", for: indexPath) as? RandomPer
        let user = users[indexPath.row]
        cell
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}
