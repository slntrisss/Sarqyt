//
//  String-PhoneNumber.swift
//  Sarqyt
//
//  Created by Raiymbek Merekeyev on 01.02.2023.
//

import Foundation

extension String {

    public mutating func toPhoneNumber() {
        let digits = self.digitsOnly
        
        if digits.count == 10 {
            self = digits.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "+7-($1)-$2-$3", options: .regularExpression, range: nil)
        }
        
        if digits.count == 11 {
            self = digits.replacingOccurrences(of: "(\\d{1})(\\d{3})(\\d{3})(\\d+)", with: "+$1-($2)-$3-$4", options: .regularExpression, range: nil)
        }
    }
    
    public mutating func toDate(from date: Date){
        let formatter = DateFormatter()
        formatter.dateFormat = "DD/MM/yyyy"
        self = formatter.string(from: date)
    }

    public mutating func toDateFormat(){
        let digits = self.digitsOnly
        if digits.count == 3 {
            self = digits.replacingOccurrences(of: "(\\d{2})", with: "$1/", options: .regularExpression, range: nil)
        }
        if digits.count == 5{
            self = digits.replacingOccurrences(of: "(\\d{2})(\\d{2})", with: "$1/$2/", options: .regularExpression, range: nil)
        }
        if digits.count == 8{
            self = digits.replacingOccurrences(of: "(\\d{2})(\\d{2})(\\d{4})", with: "$1/$2/$3", options: .regularExpression, range: nil)
        }
    }
}

extension StringProtocol {

    var digitsOnly: String {
        return String(filter(("0"..."9").contains))
    }

}
