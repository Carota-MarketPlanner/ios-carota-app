//
//  Dictionary+Request.swift
//  Carota
//
//  Created by Elias Ferreira on 28/02/25.
//

extension Dictionary {
    func toRouteParams() -> String {
        var paramsString = String()
        
        self.forEach { param in
            paramsString.append("/\(param.value)")
        }
        
        return paramsString
    }
    
    func toQueryParams() -> String {
        var paramsString = String()
            
        for (index, param) in self.enumerated() {
            let prefix = index == 0 ? "?" : "&"
            paramsString.append("\(prefix)\(param.key)=\(param.value)")
        }
        
        return paramsString
    }
}
