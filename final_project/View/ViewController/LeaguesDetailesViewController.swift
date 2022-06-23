//
//  LeaguesDetailesViewController.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import UIKit
import SafariServices
class LeaguesDetailesViewController:UIViewController {
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
   
    @IBOutlet weak var tableview: UITableView!
    @IBAction func favourite(_ sender: UIButton) {
        print("hello")
        db.addMoviejsonind(appDelegate: appDelegate, strname: checkstrname)
    }
    var checkstrname:String = ""
    var checkarrstr:[String] = []
    var leaguesDetailes = [LeaguesDetaile]()
    var leg:League?
    var eventdetailes = [Event]()
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        checkarrstr = checkstrname.components(separatedBy: " ")
        print(checkstrname)
        
        let leaguPresenter : LeaguesDetailesPresenter = LeaguesDetailesPresenterr(LeaguesDetailes: self)
        let eventPresenter : EventPresenterr = EventPresenterr(LeaguesDetailes: self)
        switch (checkarrstr.count)
        {
        case 1 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])")
        case 2 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])")
        case 3:
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])")
        case 4 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])")
        case 5 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])")
        case 6 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])")
        case 7 :
            leaguPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_\(checkarrstr[6])")
            eventPresenter.fetchData(endPoint: "\(checkarrstr[0])_\(checkarrstr[1])_\(checkarrstr[2])_\(checkarrstr[3])_\(checkarrstr[4])_\(checkarrstr[5])_\(checkarrstr[6])")
        default :
            showalert()
        }
       
    }
}

extension LeaguesDetailesViewController : LeaguesDetailesView{
    func renderHomeView(leagues: [LeaguesDetaile]) {
        self.leaguesDetailes = self.leaguesDetailes + leagues

        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }

    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }


}


extension LeaguesDetailesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == collection {
            return leaguesDetailes.count
//        }else  {
//            return 10
//        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == collection{
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "celldown", for: indexPath) as! LeaguesDetailesCollectionViewCelldown
            cell.imagev.roundImg()
            cell.imagev.loadFrom(URLAddress: leaguesDetailes[indexPath.row].strTeamBadge ?? "")
            return cell
//        }else  {
//            let cell = collection.dequeueReusableCell(withReuseIdentifier: "cellup", for: indexPath) as! LeaguesDetailesCollectionViewCellup
//            cell.textlabel2.text = "mo"
//            return cell
//        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == collection{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "cellteam") as! ViewController2
            vc.team = leaguesDetailes[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
//        }else {
//            print("yarb")
//        }
       

    }
    
}


extension LeaguesDetailesViewController{
    func showalert(){
        let alert = UIAlertController(title: "Sorry", message: "This Leagues Will Coming Soon ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}



extension LeaguesDetailesViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventdetailes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesDetailesTableViewCell
        cell.event.text = eventdetailes[indexPath.row].strEvent
        cell.data.text = eventdetailes[indexPath.row].dateEvent
        cell.time.text = eventdetailes[indexPath.row].strTime
        return cell
    }
    
    
}


extension LeaguesDetailesViewController : EventsView{
    func renderHomeView(users: [Event]) {
        self.eventdetailes = self.eventdetailes + users
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
        func postErrorHomeView(error: Error) {
              print(error.localizedDescription)
           }
        
    }
}
