//
//  DateExtentionFile.swift
//  CalendarApp
//
//  Created by 渡辺琳 on 2022/12/07.
//

import Foundation

extension Date{
    func firstDayOfTheMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
    
    mutating func plusOneDay() {
        self = Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    func changeMonth(diff:Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: diff, to: self)!
    }
    
    func getAllDays() -> [Date]{
        
        var day1st = firstDayOfTheMonth()
        //Dateのからの配列を宣言する
        var days = [Date]()
        //配列の要素を１つ追加する
        days.append(day1st)
        
        let range = Calendar.current.range(of: .day, in: .month, for: day1st)!
        
        
        for _ in 0..<range.count - 1{
            //日付けを1日加算して配列に追加する
            day1st.plusOneDay()
            days.append(day1st)
        }
        
        return days
    }
    
    //曜日を数値として返す　(0:日曜，6:土曜)
    func getWeekDay() -> Int {
        return Calendar.current.component(.weekday, from: self) - 1
    }
    
    //Dateからフォーマット通りにStringに変換する
    func DateToString(format:String) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.timeZone = TimeZone.current
        df.dateFormat = format
        
        return df.string(from: self)
    }
}
