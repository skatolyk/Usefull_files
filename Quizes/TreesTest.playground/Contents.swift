protocol Node {
    func getAllLeafs() -> [Leaf]
}

extension Node {
    func getAllLeafs() -> [Leaf] {
        switch self {
        case let leaf as Leaf:
            return [leaf]
            
        case let group as Group:
            return group.children.flatMap { $0.getAllLeafs() }
            
        default:
            fatalError("Unexpected")
        }
    }
}

struct Group: Node {
    var children: [Node]
}

struct Leaf: Node, Hashable {
    var value: Int
}

// Example:
//         *
//        / \
//       *   3
//      / \
//     1   *
//        / \
//       2   1
//
// Ouput: [1, 2, 3]

/// Traverses the tree starting at the supplied node and returns an array containing all of the unique leafs in the tree
/// - Parameter rootNode: the root node of the tree
/// - Returns: An array of all the unique leafs in the tree
func uniqueValues(rootNode: Node) -> [Leaf] {
    rootNode.getAllLeafs().unique
}

extension Array where Element: Hashable {
    var unique: [Element] {
        Array(Set(self))
    }
}




// MARK: Do not modify code below this line!

struct TestSuite {
    private enum Result: String {
        case passed
        case failed
    }

    static let shared = TestSuite()

    func runTests() {
        print("Test 1: " + test1().rawValue)
        print("Test 2: " + test2().rawValue)
        print("Test 3: " + test3().rawValue)
        print("Test 4: " + test4().rawValue)
        print("Test 5: " + test5().rawValue)
        print("Test 6: " + test6().rawValue)
        print("Test 7: " + test7().rawValue)
        print("Test 8: " + test8().rawValue)
        print("Test 9: " + test9().rawValue)
        print("Test 10: " + test10().rawValue)
    }

    private func test1() -> Result {
        let tree = Group(children: [])
        let uniqueValues = uniqueValues(rootNode: tree)
        return uniqueValues.isEmpty ? .passed : .failed
    }

    private func test2() -> Result {
        let tree = Leaf(value: 1)
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 1
        && uniqueValues.contains(where: { $0.value == 1 })
        return passed ? .passed : .failed
    }

    private func test3() -> Result {
        let tree = Group(children:
                            [Leaf(value: 1),
                             Leaf(value: 2),
                             Leaf(value: 3)
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 3
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        && uniqueValues.contains(where: { $0.value == 3 })
        return passed ? .passed : .failed
    }

    private func test4() -> Result {
        let tree = Group(children:
                            [Group(children:
                                    [Leaf(value: 1),
                                     Group(children:
                                            [Leaf(value: 2),
                                             Leaf(value: 1)]
                                          )
                                    ]
                                  ),
                             Leaf(value: 3)
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 3
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        && uniqueValues.contains(where: { $0.value == 3 })
        return passed ? .passed : .failed
    }

    private func test5() -> Result {
        let tree = Group(children:
                            [Group(children:
                                    [Leaf(value: 1),
                                     Group(children:
                                            [Leaf(value: 1),
                                             Leaf(value: 1)]
                                          )
                                    ]
                                  ),
                             Leaf(value: 1)
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 1
        return passed ? .passed : .failed
    }

    private func test6() -> Result {
        let tree = Group(children:
                            [Group(children: [Leaf(value: 1)]),
                             Group(children: [Leaf(value: 2)]),
                             Group(children: [Leaf(value: 3)])
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 3
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        && uniqueValues.contains(where: { $0.value == 3 })
        return passed ? .passed : .failed
    }

    private func test7() -> Result {
        let tree = Group(children:
                            [Leaf(value: 1),
                             Group(children: 
                                    [Leaf(value: 2),
                                     Leaf(value: 3),
                                     Leaf(value: 4),
                                     Leaf(value: 5)]),
                             Leaf(value: 6)
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 6
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        && uniqueValues.contains(where: { $0.value == 3 })
        && uniqueValues.contains(where: { $0.value == 4 })
        && uniqueValues.contains(where: { $0.value == 5 })
        && uniqueValues.contains(where: { $0.value == 6 })
        return passed ? .passed : .failed
    }
    
    private func test8() -> Result {
        let tree = Group(children:
                            [Leaf(value: 1),
                             Group(children:
                                    [Leaf(value: 2),
                                     Leaf(value: 2),
                                     Leaf(value: 2),
                                     Leaf(value: 2)
                                    ]),
                             Leaf(value: 3)
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 3
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        && uniqueValues.contains(where: { $0.value == 3 })
        return passed ? .passed : .failed
    }

    private func test9() -> Result {
        let tree = Group(children:
                            [Leaf(value: 1),
                             Leaf(value: 2),
                             Group(children:
                                    [Leaf(value: 1),
                                     Leaf(value: 1),
                                     Leaf(value: 2),
                                     Leaf(value: 2)])
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 2
        && uniqueValues.contains(where: { $0.value == 1 })
        && uniqueValues.contains(where: { $0.value == 2 })
        return passed ? .passed : .failed
    }

    private func test10() -> Result {
        let tree = Group(children:
                            [Group(children:
                                    [Group(children:
                                            [Group(children:
                                                    [Group(children: [Leaf(value: 1)])])])])
                            ])
        let uniqueValues = uniqueValues(rootNode: tree)
        var passed = uniqueValues.count == 1
        && uniqueValues.contains(where: { $0.value == 1 })
        return passed ? .passed : .failed
    }
}

TestSuite.shared.runTests()
