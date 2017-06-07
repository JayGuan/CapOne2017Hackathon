//: Playground - noun: a place where people can play

import UIKit

let url = NSURL(string: "http://api.reimaginebanking.com/atms?key=7d41a955b7b3d9bd4750aabefec1ce16")
let task = NSURLSession.sharedSession().dataTaskWithURL(url!){
    (data, response, error) in
    print(NSString(data: data, encoding: NSUTF8StringEncoding))
}
task.resume()

print(task)