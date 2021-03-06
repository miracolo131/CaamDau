//Created  on 2018/12/16  by LCD :https://github.com/liucaide .

import UIKit


public struct R_Home: CD_RowVCProtocol {
    public var vc: UIViewController {
        return VC_Home.cd_storyboard("HomeStoryboard", from: "Home") as! VC_Home
    }
    
    public init() {
        
    }
}

class VC_Home: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var vm:VM_Home = {
        return VM_Home()
    }()
    
//    lazy var modelMj:CD_MJRefreshModel = {
//        //var m = CD_MJRefreshModel()
//
//        return m
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.cd
            .estimatedAll()
    }
}


extension VC_Home:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        let num = vm.forms.count
        return num
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.forms[section].count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = vm.forms[indexPath.section][indexPath.row]
        return row.h
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = vm.forms[indexPath.section][indexPath.row]
        let cell = tableView.cd.cell(row.viewClass)
        row.bind(cell!)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = vm.forms[indexPath.section][indexPath.row]
        row.didSelect?()
    }
    
}
