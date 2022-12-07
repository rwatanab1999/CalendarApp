//
//  ContentView.swift
//  CalendarApp
//
//  Created by 渡辺琳 on 2022/12/07.
//

import SwiftUI

struct ContentView: View {
    let week:[String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    @State var diff:Int = 0
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {diff -= 1}, label: {
                    Image(systemName: "lessthan.circle.fill").foregroundColor(.gray).opacity(0.2)
                })
                Text(Date().changeMonth(diff: diff).DateToString(format: "yyyy / M"))
                Button(action: {diff += 1}, label: {
                    Image(systemName: "greaterthan.circle.fill").foregroundColor(.gray).opacity(0.2)
                })
            }
            
            ScrollView{
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 7))
                {
                    ForEach(week, id: \.self){ i in
                        Text(i)
                    }
                    
                    let days:[Date] = Date().changeMonth(diff: diff).getAllDays()
                    let start = days[0].getWeekDay()
                    let end = start + days.count
                    
                    ForEach((0...41), id: \.self){index in
                        ZStack{
                            if(index >= start && index < end){
                                let i = index - start
                                Text(days[i].DateToString(format: "d"))
                                if(days[i].DateToString(format: "d") == "1")
                                {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.green)
                                        .opacity(0.2)
                                }
                                else
                                {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.gray)
                                        .opacity(0.2)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
