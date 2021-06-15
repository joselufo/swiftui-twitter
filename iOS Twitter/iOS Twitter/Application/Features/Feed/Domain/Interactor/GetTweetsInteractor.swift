//
//  GetTweetsInteractor.swift
//  iOS Twitter
//
//  Created by Jose Luis Franconetti Olmedo on 15/6/21.
//

import Foundation

class GetTweetsInteractor {
    
    func execute() -> [Tweet] {
        let users = [
            User(id: UUID(), name: "Jose Luis", avatar: randomColor(), username: "@joselufo"),
            User(id: UUID(), name: "Victor", avatar: randomColor(), username: "@victor"),
            User(id: UUID(), name: "Javier", avatar: randomColor(), username: "@javi")
        ]
        
        let tweets: [Tweet] = [
            Tweet(user: users.randomElement()!, message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
            Tweet(user: users.randomElement()!, message: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using", image: randomColor(), url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
            Tweet(user: users.randomElement()!, message: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
            Tweet(user: users.randomElement()!, message: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old", image: nil, url: nil, messageCount: random(), retweetCount: random(), favouriteCount: random()),
        ]
        
        return tweets
    }
    
    private func random() -> Int {
        Int.random(in: 0...400)
    }
    
    private func randomColor() -> String {
        let colors = ["FF5733", "339FFF", "FF9633"]
        return colors.randomElement()!
    }
}
