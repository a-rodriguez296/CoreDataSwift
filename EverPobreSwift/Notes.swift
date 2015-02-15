@objc(Notes)
class Notes: _Notes {

	// Custom logic goes here.
    
    convenience init(name:String, context:NSManagedObjectContext){
        self.init(managedObjectContext:context)
        
        self.name = name
        self.creationDate = NSDate()
        
    }
    

}
