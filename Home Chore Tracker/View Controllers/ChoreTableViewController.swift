//
//  ChoreTableViewController.swift
//  Home Chore Tracker
//
//  Created by Jerry Haaser on 10/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import CoreData

protocol ChoreTableViewDelegate {
    func updatePoints()
}

class ChoreTableViewController: UITableViewController {
    
    var choreController: ChoreController!
    var chore: Chore!
    var delegate: ChoreTableViewDelegate?
    
    lazy var assignmentFRC: NSFetchedResultsController<Assignment> = {
        
        let fetchRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "choreName", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.shared.mainContext,
                                             sectionNameKeyPath: "choreName",
                                             cacheName: nil)
        
        do {
            try frc.performFetch()
        } catch {
            fatalError("Error performing fetch for frc: \(error)")
        }
        
        return frc
    }()
    
    lazy var fetchedResultsController: NSFetchedResultsController<Chore> = {
        
        let fetchRequest: NSFetchRequest<Chore> = Chore.fetchRequest()
        
        if let assignments = assignmentFRC.fetchedObjects {
            let namesToFetch = assignments.map({ $0.choreName })
            fetchRequest.predicate = NSPredicate(format: "choreLabel IN %@", namesToFetch)
        }
        
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "choreCompleted", ascending: true),
            NSSortDescriptor(key: "choreLabel", ascending: true)
        ]
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: CoreDataStack.shared.mainContext,
                                             sectionNameKeyPath: "choreCompleted",
                                             cacheName: nil)
        
        frc.delegate = self
        
        do {
            try frc.performFetch()
        } catch {
            fatalError("Error performing fetch for frc: \(error)")
        }
        
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChoreCell", for: indexPath) as? ChoreTableViewCell else { return UITableViewCell() }

        cell.chore = fetchedResultsController.object(at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionInfo = fetchedResultsController.sections?[section] else { return nil }
        
        if sectionInfo.name == "0" {
            return "Chores Not Completed"
        } else {
            return "Chores Completed"
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "ShowChoreDetailView" {
            guard let detailVC = segue.destination as? ChoreDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let chore = fetchedResultsController.object(at: indexPath)
            detailVC.chore = chore
            detailVC.choreController = choreController
            detailVC.delegate = delegate
        }
    }
}

extension ChoreTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath else { return }
            
            tableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        @unknown default:
            fatalError("Unknown Fetched Results Change Type.")
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange sectionInfo: NSFetchedResultsSectionInfo,
                    atSectionIndex sectionIndex: Int,
                    for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        
        switch type {
        case .insert:
            tableView.insertSections(indexSet, with: .automatic)
        case .delete:
            tableView.deleteSections(indexSet, with: .automatic)
        default:
            return
        }
    }
}
