//
//  ContentView.swift
//  WEVE
//
//  Created by Sol Choi on 2022/04/22.
//

import SwiftUI
import SwiftUICharts
import CoreData

struct ContentView: View {
    @State var isFavorite = false;
    var body: some View {
        if isFavorite {
            FavoriteTabView(isFavorite: $isFavorite)
                .padding()
        } else {
            TabView{
                HomeTabView(isFavorite: $isFavorite)
                    .padding()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                SearchTabView()
                    .padding()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                PointTabView()
                    .padding()
                    .tabItem {
                        Image(systemName: "banknote.fill")
                        Text("Point")
                    }
                CategoryTabView()
                    .padding()
                    .tabItem {
                        Image(systemName: "slider.horizontal.3")
                        Text("Category")
                    }
                AccountTabView()
                    .padding()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                    }
            }
        }
    }
}

struct FavoriteTabView: View {
    @Binding var isFavorite: Bool
    var body: some View {
        VStack(alignment:.leading) {
            HStack(){
                Button(action: {
                    isFavorite = !isFavorite
                }){
                    Image(systemName: "chevron.backward")
                        .scaleEffect(x: 2, y: 2)
                }
            }
            .frame(alignment: .trailing)
            .padding()
            Text("Favorites")
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                .font(.title)
            GameList()
            Divider()
        }
    }

}

struct HomeTabView: View {
    @Binding var isFavorite: Bool
    
    var rankers = [Ranker(id: 1, rank:1,name: "Andrew"),Ranker(id: 2, rank:2,name: "James"),Ranker(id: 3, rank:3,name: "Harry")]
    
    var body: some View {
        VStack(){
            HStack(){
                Button(action: {}){
                    Image(systemName: "bell.fill")
                }
                
                
                Text("WEVE")
                    .fontWeight(.bold)
                    .padding()
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                Button(action: {
                    isFavorite = !isFavorite
                }){
                    Image(systemName: "star.fill")
                }
                
            }
            .frame(alignment: .trailing)
            .padding(0)
            .offset(x:15)
            Spacer()
            
            ScrollView {
                Spacer()
                TabView {
                    Image("homeAd1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    //                    .edgesIgnoringSafeArea(.all)
                    //                    .scaleEffect(y: 2)
                    Image("Sample2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    //                    .edgesIgnoringSafeArea(.all)
                    //                    .scaleEffect(y: 2)
                }
                .tabViewStyle(.page)
                .frame(height: 150)
                //                .scaleEffect(x: 2, y: 2)
                Divider()
                
                VStack{
                    VStack (alignment: .leading){
                        Text("Ranking")
                            .font(.title)
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0))
                        HStack(alignment:.center){
                            ForEach(rankers) {ranker in
                                
                                VStack(alignment: .center){
                                        Text(String(ranker.rank))
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        Text(ranker.name)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    Divider()
                                }
                        }
                        
                        ZStack(alignment: .topLeading){
                            
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3)
                                .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                                .frame(width: 350 ,height: 330)
                                .padding()
                            
                            Text("")
                                .padding()
                            
                            VStack{
                                Text("Today")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                HStack{
                                    Image("todayGame1")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading){
                                        Text("Crossy Roads")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's")
                                            .font(.system(size: 10))
                                    }
                                }.padding(.vertical, 5)
                                
                                Divider()
                                
                                HStack{
                                    Image("todayGame2")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading){
                                        Text("Geometry Dash")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's")
                                            .font(.system(size: 10))
                                    }
                                }.padding(.vertical, 5)
                                
                                Divider()
                                
                                HStack{
                                    Image("todayGame3")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                    VStack(alignment: .leading){
                                        Text("Candy Crush")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's")
                                            .font(.system(size: 10))
                                    }
                                }.padding(.bottom,10)
                                
                                
                            }
                            .offset(x:5,y:5)
                            .padding(30)
                        
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct AccountTabView: View {
    var body: some View {
        ScrollView (.vertical) {
            VStack(alignment: .leading, spacing: 10){
                Text("Username")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(0)
                    .font(.title)
                Spacer(minLength: 10)
                HStack(spacing: 10){
                    
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                            .frame(height: 100)
                        VStack(alignment: .leading){
                            Text("Point")
                            Text("0 P").font(Font.body.bold())
                        }.padding(.leading, 20)
                    }
                
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                            .frame(height: 100)
                        VStack(alignment: .leading){
                            Text("Coupon")
                            Text("0 C").font(Font.body.bold())
                        }.padding(.leading, 20)
                    }
                    
                }
                HStack(spacing: 10){
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                            .frame(height: 100)
                        VStack{
                            Text("Orderered")
                                .padding(.bottom, 1)
                            Text("0").font(Font.body.bold())
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                            .frame(height: 100)
                        VStack{
                            Text("Review")
                                .padding(.bottom, 1)
                            Text("0").font(Font.body.bold())
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.init(red: 150/255, green: 165/255, blue: 230/255))
                            .frame(height: 100)
                        VStack{
                            Text("Inquiry")
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 1)
                            Text("0").font(Font.body.bold())
                        }
                    }
                }.font(.system(size: 13))
                Spacer()
                Button("Announcement", action: {self.showAnnouncement()})
                    .padding()
                    .font(.body)
                Button("Customer Service", action: {showCustomerService()})
                    .padding()
                    .font(.body)
                Spacer()
            }
            .frame(alignment: .topLeading)
            .padding()
        }
    }
    
    func showAnnouncement(){
        print("Show Announcement!")
    }
    
    func showCustomerService(){
        print("Show Customer Service!")
    }
    
}

struct SearchTabView : View {
    @State private var text: String = ""

       @State private var isEditing = false
           
       var body: some View {
           ScrollView {
               VStack (alignment: .leading) {
               Text("")
               HStack {
               
                   TextField("Search ...", text: $text)
                       .padding(7)
                       .padding(.horizontal, 25)
                       .background(Color(.systemGray6))
                       .cornerRadius(8)
                       .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                               .foregroundColor(.gray)
                               .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                               .padding(.leading, 8)
                           
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                            
                            }
                       )
                       .padding(.horizontal, 10)
                       .onTapGesture {
                           self.isEditing = true
                       }
                   
                   if isEditing {
                       Button(action: {
                           self.isEditing = false
                           self.text = ""
                           UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                           }) {
                           Text("Cancel")
                           }
                           .padding(.trailing, 10)
                           .transition(.move(edge: .trailing))
                    
                   }
                 
               }
               .ignoresSafeArea(.keyboard, edges: .bottom)

            
               Text("Recent History")
                   .padding(.vertical, 7)
                   .padding(.horizontal, 14)
                   .font(.title)

               Group {


               
            Text("Game name 1")
                .font(.body)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .cornerRadius(10)
             
            Text("Game name 2")
                .font(.body)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .cornerRadius(10)
               
            Text("Game name 3")
                .font(.body)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .cornerRadius(10)
               
            Text("Game name 4")
                .font(.body)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .cornerRadius(10)
               
            Text("Game name 5")
                .font(.body)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .cornerRadius(10)
               
            }
            
               
            Text("Top Searched")
                .padding(.vertical, 7)
                .padding(.horizontal, 14)
                .font(.title)
               
            Group {

               
            Text("1. Game name 1")
                .font(.body)
                .foregroundColor(Color(.blue))
                .padding(.horizontal,14)
                .padding(.vertical,4)
                .cornerRadius(10)
            
            Rectangle()
                .fill(Color(.systemGray2))
                .frame(height: 1)
                
            Text("2. Game name 2")
                .font(.body)
                .foregroundColor(Color(.blue))
                .padding(.horizontal,14)
                .padding(.vertical,4)
                .cornerRadius(10)
                
            Rectangle()
                .fill(Color(.systemGray2))
                .frame(height: 1)
                    
            Text("3. Game name 3")
                .font(.body)
                .foregroundColor(Color(.blue))
                .padding(.horizontal,14)
                .padding(.vertical,4)
                .cornerRadius(10)

            Rectangle()
                .fill(Color(.systemGray2))
                .frame(height: 1)
                       
            Text("4. Game name 4")
                .font(.body)
                .foregroundColor(Color(.blue))
                .padding(.horizontal,14)
                .padding(.vertical,4)
                .cornerRadius(10)
                
            Rectangle()
                .fill(Color(.systemGray2))
                .frame(height: 1)
                        
            Text("5. Game name 5")
                .font(.body)
                .foregroundColor(Color(.blue))
                .padding(.horizontal,14)
                .padding(.vertical,4)
                .cornerRadius(10)
                
            Rectangle()
                .fill(Color(.systemGray2))
                .frame(height: 1)
                
            }

            
            Group {

                  
               Text("6. Game name 6")
                   .font(.body)
                   .foregroundColor(Color(.blue))
                   .padding(.horizontal,14)
                   .padding(.vertical,4)
                   .cornerRadius(10)
               
               Rectangle()
                   .fill(Color(.systemGray2))
                   .frame(height: 1)
                   
               Text("7. Game name 7")
                   .font(.body)
                   .foregroundColor(Color(.blue))
                   .padding(.horizontal,14)
                   .padding(.vertical,4)
                   .cornerRadius(10)
                   
               Rectangle()
                   .fill(Color(.systemGray2))
                   .frame(height: 1)
                       
               Text("8. Game name 8")
                   .font(.body)
                   .foregroundColor(Color(.blue))
                   .padding(.horizontal,14)
                   .padding(.vertical,4)
                   .cornerRadius(10)
                
                Rectangle()
                    .fill(Color(.systemGray2))
                    .frame(height: 1)
                
            }
               
            Spacer()
            
            }
               
           }
           .onTapGesture {
               UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
               
           }
           .ignoresSafeArea(.keyboard, edges: .bottom)
           
       }
}

struct Ranker : Identifiable, Hashable, Codable {
    var id: Int
    var rank: Int
    var name: String
}

struct PointTabView: View {
    @State var apiKey = "241T3tRyRn99uD0q7b89v7whElC6GnU133bFBI7N"
    @State var url = "https://3nkue0cilb.execute-api.ap-northeast-2.amazonaws.com/dev/truffle-hackathon-dev-TruffleHackathon?value=25000000000000000000"
    var rankers = [Ranker(id: 1, rank:1,name: "Hello"),Ranker(id: 2, rank:2,name: "James")]
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Section(){
                    LineView(data: [8,23,54,32,12,37,7,23,43], title: "Donation Status", legend: "$ / Month")
                        .frame(height: UIScreen.main.bounds.height/2.6)
                        .padding()
                }
                Text("Total Donated: $ 190")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    // HTTP Header send request
                    Task {
                        await sendCoinAWSLambda()
                        print("Coin Sent!")
                    }
                }){
                    Text("Coin Donate")
                }
                .padding()
                .font(.title)
                
                Text("Good Story With WEVE")
                    .font(.title)
                    .padding(EdgeInsets(top: 30, leading: 15, bottom: 10, trailing: 0))
                Image("donationAd")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,height: 110)
                
                Text("Achievements")
                    .font(.title)
                    .padding(EdgeInsets(top: 30, leading: 15, bottom: 10, trailing: 0))
                
                HStack(alignment: .center){
                    Spacer()
                    VStack (alignment: .center){
                        Image("achievement")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("First Donation")
                    }
                    VStack (alignment: .center){
                        Image("medal")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Successful \nDonation")
                            .multilineTextAlignment(.center)
                            
                    }.padding(.horizontal, 20)
                    VStack (alignment: .center){
                        Image("target")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Reach $ 10")
                    }
                    Spacer()
                }
                .padding()
//                .position(x: UIScreen.main.bounds.width/2, y: 40)
            }
                    
        }
        
    }
    
    func sendCoinAWSLambda() async {
        guard let actURL = URL(string: url) else {
            fatalError("Invalid ERROR")
        }
        var request = URLRequest(url: actURL)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.timeoutInterval = 60.0
        URLSession.shared.dataTask(with: request){
            (data: Data?, response: URLResponse?, error: Error?) -> Void in
        }.resume()
        print("URL: " + url)
    }
}

struct CategoryTabView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
            Text("")
                .padding(.horizontal,180)
            
            Text("Category")
                .padding(.vertical, 7)
                .padding(.horizontal,1)
                .font(.largeTitle)
                
                Group{
                
                Button {
                    
                } label: {
                    Text("RPG")
                        .font(.title)
                        .foregroundColor(Color.purple)
                        .padding(.horizontal,15)
                        .padding(.vertical,16)
                        .cornerRadius(10)
                }
             
                Button {
                    
                } label: {
                    Text("Arcade")
                        .font(.title)
                        .foregroundColor(Color.purple)
                        .padding(.horizontal,15)
                        .padding(.vertical,16)
                        .cornerRadius(10)
                }
               
                Button {
                    
                } label: {
            Text("Action")
                .font(.title)
                .padding(.horizontal,15)
                .padding(.vertical,16)
                .cornerRadius(10)
            }
                
            Button {
                    
            } label: {
                    
            Text("Shooting")
                .font(.title)
                .padding(.horizontal,15)
                .padding(.vertical,16)
                .cornerRadius(10)
            }
                
                
            Button {
                    
            } label: {
                    
                Text("Puzzle")
                    .font(.title)
                    .padding(.horizontal,15)
                    .padding(.vertical,16)
                    .cornerRadius(10)
            }
                
            Button {
                    
            } label: {
                    
                Text("Strategy")
                    .font(.title)
                    .padding(.horizontal,15)
                    .padding(.vertical,16)
                    .cornerRadius(10)
            }
                
                Button {
                    
                } label: {
                    Text("Casual")
                    .font(.title)
                    .padding(.horizontal,15)
                    .padding(.vertical,16)
                    .cornerRadius(10)
                }
                
                Button {
                    
                } label: {
                    Text("Racing")
                    .font(.title)
                    .padding(.horizontal,15)
                    .padding(.vertical,16)
                    .cornerRadius(10)
                }
            
                }
               
            Spacer()
            
            }
               
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
