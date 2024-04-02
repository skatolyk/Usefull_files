import UIKit

private let queue1 = DispatchQueue(label: "com.queue1", qos: .userInteractive, attributes: .concurrent)
private let queue2 = DispatchQueue(label: "com.queue2", qos: .utility, attributes: .concurrent)
private let queue3 = DispatchQueue(label: "com.queue3", qos: .utility, attributes: .concurrent)
private let queue4 = DispatchQueue(label: "com.queue4", qos: .userInteractive, attributes: .concurrent)


final class TestString {
    private var string: String = ""
    private let lock = NSRecursiveLock()
    
    func append(new letter: String) {
        lock.withLock {
            string.append(letter)
        }
    }
    
    func dropFirst() -> String {
        lock.withLock {
            if string.isEmpty { return "nil" }
            return String(string.remove(at: string.startIndex))
        }
    }
    
    func getFirst() -> String {
        lock.withLock {
            string.first.flatMap(String.init) ?? "Error: No String!"
        }
    }
    
    func getString() -> String {
        lock.withLock {
            string
        }
    }
}

var testString = TestString()


queue1.async {
    while true {
        printWith(new: "A")
        printWith(new: "B")
        printWith(new: "C")
    }
}

var lock = NSLock()
var isBlockStarted = false

DispatchQueue.main.async {
    while true {
//        lock.lock()
        if isBlockStarted { return }
        isBlockStarted = true
        
        let group = DispatchGroup()
        
        group.enter()
        queue2.async {
            print("Thread 2 read symbol: " + testString.getFirst())
            group.leave()
        }
        
        group.enter()
        queue3.async {
            print("Thread 3 read symbol: " + testString.getFirst())
            group.leave()
        }
        
        group.notify(queue: queue4) {
            print("Thread 4 removed symbol: " + testString.dropFirst())
            isBlockStarted = false
//            lock.unlock()
        }
    }
}

private func printWith(new letter: String) {
    testString.append(new: letter)
    print("Thread 1 added symbol: " + letter)
}
