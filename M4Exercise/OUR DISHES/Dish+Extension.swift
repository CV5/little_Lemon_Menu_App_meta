import Foundation
import CoreData


extension Dish {

    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
        
       for menuItem in menuItems{
            guard let _ = exists(name: menuItem.name, context) else { return }
            let dish = Dish(context: context)
            dish.name = menuItem.name
            if let price = Float(menuItem.price){
                dish.price = price
            }
//           saveToDataBase(context)
            
        }
    }
    
    
  
    
    
    func saveToDataBase(_ context: NSManagedObjectContext){
        
        guard context.hasChanges else {return}
        
        do{
            try context.save()
        }catch(let error){
            print(error.localizedDescription)
        }
        
    }
    
}
