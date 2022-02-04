//
//  Extensions.swift
//  todomovie4
//
//  Created by Gabriel Lemache Castro on 04/02/22.
//

import SwiftUI

// Format numbers to be like 99k
extension Double {
    func formatToK() -> String {
        let num = self > 1000 ? Double(self)/1000.0 : Double(self)
        return String(format: self >= 1000 ? "%.1fK" : "%.0f",num)
    }
}


extension String{
    func load()->UIImage{
        do{
            guard let url = URL(string: self)else{
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
            
        }catch{
            //Add error
        }
        return UIImage()
    }
}
