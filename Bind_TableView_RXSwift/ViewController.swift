//
//  ViewController.swift
//  Bind_TableView_RXSwift
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    //Variables
    let disposeBag = DisposeBag()
    
    let modelData = Observable.of([
        Contributor(pName: "Andres", pGitHubID: "phdafoe"),
        Contributor(pName: "Felipe", pGitHubID: "afoe"),
        Contributor(pName: "Ocampo", pGitHubID: "phd"),
        Contributor(pName: "Eljaiek", pGitHubID: "Elja")])
    
    
    //IBOutlets
    @IBOutlet weak var myTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myTableView.delegate = self
        //myTableView.dataSource = self
        
        modelData.asDriver(onErrorJustReturn: []).drive(myTableView.rx.items(cellIdentifier: "Cell")){ (_, model, cell) in
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.gitHubID
            cell.imageView?.image = model.image
        }.disposed(by: disposeBag)
        
        myTableView.rx.modelDeselected(Contributor.self).subscribe(onNext:{
            print("has seleccionado", $0)
        }).disposed(by: disposeBag)
        
    }

    


}

/*extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let model = modelData[indexPath.row]
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.gitHubID
        cell.imageView?.image = model.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Has selecciando:", modelData[indexPath.row])
    }
    
}*/

