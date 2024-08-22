/*
 Created an extension on Encodable to convert swift objects into dictionaries
 */
import Foundation

extension Encodable{
    
    // asDictionaryMethod()
    func asDictionary() -> [String: Any]{
        
        guard let data = try? JSONEncoder().encode(self) else{ // Converts the object to JSON data
            return[:]
            
        }
        
        do{
            
            let json = try JSONSerialization.jsonObject(with: data) as?  [String: Any] // Converts the JSON data into a dictionary
            return json ?? [:]
        }catch{
            
            return [:] // a dictionary representing the object or an empty object if encoding fails
        }
        
    }
    
}
