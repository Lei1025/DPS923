//
//  StoreInitializer.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class StoreInitializer {
    
    class func create(cdStack: CDStack) {
        
        // Add code to create data
        
        // For each object that you want to create...
        // Initialize an object
        // Set its properties
        // Save changes
        
        // This app will work with the "Example" entity that you can see in the object model
        
        // If you have not yet run the app (in the simulator), 
        // and you want to create your own object model, you can...
        // Comment out (or delete) the 'create data' code below
        // Delete the entity in the object model
        // Edit the Model class, and its fetched results controller
        // Comment out, delete, or edit the data access statements in the '...List' and '...Detail' controllers

        // If you have did run the app (in the simulator),
        // you will have to do the above, AND delete the app from the simulator
        
//        let object1 = NSEntityDescription.insertNewObjectForEntityForName("Sport", inManagedObjectContext: cdStack.managedObjectContext!) as NSManagedObject
//        
//        object1.setValue("Athletics", forKey: "sportName")
//        object1.setValue("Athletics offers a variety of iconic events. The track events feature distances from 100 metres to 10,000 metres, with the excitement of hurdles and the steeplechase as well. The field events include the throwing events of shot put, discus, javelin and hammer throw while the jumping events offer pole vault, high jump, long jump and triple jump. Track and field also includes, for men, the legendary decathlon (runs of 100 metres, 400 metres and 1,500 metres; 110-metre high hurdles; throws of javelin and discus; shot put; pole vault; high jump and long jump) and for women, the equally impressive heptathlon (100-meter hurdles, high jump, shot put, 200-metre run, long jump, javelin and 800-metre run). Track and field events will be held at the CIBC Pan/Parapan Am Athletics Stadium at York University and the road events will be held at the Ontario Place West Channel, with the start and finish line on Lake Shore Blvd. Canada is expecting to field one of its strongest teams ever in 2015. The Canadian team won a historic five medals in the sport at the 2013 World Championship, including a bronze in the 4 x 100 m sprint relay. At the Glasgow 2014 Commonwealth Games, the Canadian team won 17 medals, including gold from Sultana Frizell (women’s hammer), James Steacy (men’s hammer), Derek Drouin (men’s high jump), Brianne Theisen-Eaton (women’s heptathlon) and Damian Warner (men’s decathlon). Colombian triple jumper Caterine Ibargüen, a silver medallist at the London 2012 Olympic Games, helped her country win a record eight medals at those Games. She is expected to be one of the favourites in Toronto. Another pair to watch — arguably the ''world’s fittest couple” — in 2015 are Canadian heptathlete Brianne Theisen-Eaton, who won a silver medal at the 2013 World Championships, and her American husband Ashton Eaton, Olympic champion, world champion and world record holder in the decathlon.", forKey: "sportDescription")
//        
//        object1.setValue("Marathon A test of endurance, the marathon is a mass start event where athletes run 26.2 miles (42.2 kilometres) on pavement. First to cross the finish line wins. Track and field Track and field consists of sprint, middle- and long-distance track events, hurdles, relays, long jump, triple jump, high jump, pole vault, shot put, discus, hammer throw, javelin, steeple chase and the combined events of decathlon and heptathlon. Race walk In the race walk, athletes must have one foot in contact with the ground at all times as well as keeping their supporting leg straight. They must hold this position from the time their foot first impacts the ground until the supporting leg passes below the body. To increase their pace, athletes will swivel and tilt their hips to lengthen their stride. Participants are watched closely by officials surrounding the race course to ensure that they comply with the rules. Men race in distances of 20 and 50 kilometres; women compete in a 20-kilometre event.", forKey: "howItWorks")
//        
//        object1.setValue("Athletics dates back to the ancient Greeks of 776 BC when the only event at the first Olympic Games was a foot race that covered the length of the Athenian Olympic stadium. The modern form of athletics, including a variety of running, jumping, throwing, walking and combined events, evolved in the 19th century. Athletics includes the disciplines of marathon, track and field and race walk.", forKey: "history")
//        
//        
//        let object2 = NSEntityDescription.insertNewObjectForEntityForName("Venue", inManagedObjectContext: cdStack.managedObjectContext!) as NSManagedObject
//
//        
//        object2.setValue("Angus Glen Golf Club", forKey: "venueName")
//        object2.setValue("Angus Glen Golf Club, one of Canada’s most prestigious golf courses, will host the first-ever Pan Am Games golf tournament in July 2015. The championship-level golf course has hosted the Canadian Open twice — once on the south course in 2002 and on the north course in 2007. Angus Glen was selected through a request for proposals (RFP) process conducted by Golf Canada on behalf of TO2015 in 2012. In 2015, the Pan Am golf tournament, which includes men’s and women’s events, will welcome both professional and amateur players. Sixty-four golfers will tee off in the 72-hole competition on Angus Glen’s south course. The Pan Am competition will take place a year ahead of the return of golf to Olympic competition at the Rio Games for the first time in more than 100 years.", forKey: "venueDescription")
//        object2.setValue("10080 Kennedy Road, Markham, ON", forKey: "location")
//        
//        cdStack.saveContext()
    }
    
    // Create a new date object
    class func newDate(year: Int, month: Int, day: Int) -> NSDate {
        
        // Configure the objects we need to create the date
        var cal = NSCalendar(identifier: NSGregorianCalendar)!
        cal.timeZone = NSTimeZone(abbreviation: "GMT")!
        var dc = NSDateComponents()
        
        // Set the values of the date components
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = 12
        dc.minute = 0
        dc.second = 0
        
        return cal.dateFromComponents(dc)!
    }
    
}
