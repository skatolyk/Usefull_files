// which line(cases 1-4) will cause compile error?

class External {
    private var a = 0
    public var b = 0

    init() {
        var inner = Inner(self);
        inner.c = 1; // 1
        inner.d = 1; // 2
    }

    class Inner {
        private var c = 0
        public var d = 0

        init(_ externalClass: External) {
            externalClass.a = 1; // 3
            externalClass.b = 1; // 4
        }
    }
}

var instance = External()