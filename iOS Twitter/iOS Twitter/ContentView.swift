//
//  ContentView.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 14/6/21.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    
    let name: String
    let avatar: Color
    let username: String
}

struct Tweet: Identifiable {
    let id = UUID()
    
    let user: User
    let message: String
    let date: Date = Date().addingTimeInterval(Double.random(in: -100000...0))
    
    let image: Color?
    let url: String?
    
    let messageCount: Int
    let retweetCount: Int
    let favouriteCount: Int
}

let users = [
    User(name: "Jose Luis", avatar: Color.red, username: "@joselufo"),
    User(name: "Victor", avatar: Color.blue, username: "@victor"),
    User(name: "Javier", avatar: Color.orange, username: "@javi")
]

private func random() -> Int {
    Int.random(in: 0...400)
}

let tweets: [Tweet] = [
    Tweet(user: users.randomElement()!, message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
    Tweet(user: users.randomElement()!, message: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using", image: Color.red, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
    Tweet(user: users.randomElement()!, message: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
    Tweet(user: users.randomElement()!, message: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
]

struct ContentView: View {
    
    static var dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    var body: some View {
        List(tweets) { tweet in
            TweetView(tweet: tweet).padding(4)
        }.listStyle(GroupedListStyle())
        .navigationTitle("Tweets")
    }
}

struct TweetView: View {
    
    var tweet: Tweet
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                Circle()
                    .fill(tweet.user.avatar)
                    .frame(width: 50, height: 50)
                
                TweetContentView(tweet: tweet)
            }
        }
    }
}

struct TweetContentView: View {
    var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(tweet.user.name).bold().lineLimit(1)
                Text(tweet.user.username).foregroundColor(.gray).font(.system(size: 14))
                Text("-").foregroundColor(.gray).font(.system(size: 14))
                Text("\(ContentView.dateFormatter.localizedString(for: tweet.date, relativeTo: Date()))").foregroundColor(.gray).font(.system(size: 14))
                Spacer()
                Image(systemName: "arrowshape.turn.up.forward").frame(width: 5, height: 5, alignment: .center)
            }.padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 0))
            
            Text(tweet.message).lineLimit(5)
            
            if let img = tweet.image {
                Rectangle()
                    .fill(img)
                    .frame(width: .infinity, height: 120, alignment: .center)
            }
            ActionBottomView(tweet: tweet)
        }
    }
}

struct ActionBottomView: View {
    
    var tweet: Tweet
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                if tweet.messageCount > 0 {
                    Text("\(tweet.messageCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "arrow.2.squarepath")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                
                if tweet.retweetCount > 0 {
                    Text("\(tweet.retweetCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .foregroundColor(.gray)
                
                if tweet.favouriteCount > 0 {
                    Text("\(tweet.favouriteCount)").font(.system(size: 12)).foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

