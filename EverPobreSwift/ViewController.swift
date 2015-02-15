//
//  ViewController.swift
//  EverPobreSwift
//
//  Created by Alejandro Rodriguez on 2/14/15.
//  Copyright (c) 2015 Alejandro Rodriguez. All rights reserved.
//

import UIKit

class ViewController: KIBaseFetchedResultsController {
    
    
    var alertTextField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var req = NSFetchRequest(entityName: Notes.entityName())
        req.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        var results = NSFetchedResultsController(fetchRequest: req, managedObjectContext: NSManagedObjectContext.MR_defaultContext(), sectionNameKeyPath: nil, cacheName: nil)
        self.fetchedResultsController = results
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var note = fetchedResultsController.objectAtIndexPath(indexPath) as Notes
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as?UITableViewCell
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = note.name
        
        return cell!
    }
    
    @IBAction func addNote(sender: AnyObject) {
        
        let alertController: UIAlertController = UIAlertController(title: "Attention", message: "Add new note", preferredStyle: .Alert)
        

        
        alertController.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            self.alertTextField = textfield
        }
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            
            if let unwrappedTextfield = self.alertTextField{
                self.createNote(noteName:unwrappedTextfield.text!)
            }
            
            
            
        }
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    func createNote(noteName name:String){
        
        Notes(name:name, context: NSManagedObjectContext.MR_defaultContext())
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreWithCompletion { (succes, error) -> Void in
            
            
        }
    }
}

