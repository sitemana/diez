
public final class ChildComponent: NSObject, Decodable, Updatable {
    public var diez: CGFloat

    private enum CodingKeys: String, CodingKey {
        case diez
    }

    override init() {
        diez = 10
    }

    init(
        diez: CGFloat
    ) {
        self.diez = diez
    }


    public func update(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        diez = try container.decode(CGFloat.self, forKey: .diez)
    }
}

public final class Primitives: NSObject, StateBag {
    public var number: CGFloat
    public var integer: Int
    public var float: CGFloat
    public var string: String
    public var boolean: Bool
    public var integers: [[CGFloat]]
    public var strings: [[[String]]]
    public var child: ChildComponent

    private enum CodingKeys: String, CodingKey {
        case number
        case integer
        case float
        case string
        case boolean
        case integers
        case strings
        case child
    }

    public override init() {
        number = 10
        integer = 10
        float = 10
        string = "ten"
        boolean = true
        integers = [[1, 2], [3, 4], [5]]
        strings = [[["6"], ["7"]], [["8"], ["9"]], [["10"]]]
        child = ChildComponent()
    }

    init(
        number: CGFloat,
        integer: Int,
        float: CGFloat,
        string: String,
        boolean: Bool,
        integers: [[CGFloat]],
        strings: [[[String]]],
        child: ChildComponent
    ) {
        self.number = number
        self.integer = integer
        self.float = float
        self.string = string
        self.boolean = boolean
        self.integers = integers
        self.strings = strings
        self.child = child
    }

    public static let name = "Primitives"

    public func update(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        number = try container.decode(CGFloat.self, forKey: .number)
        integer = try container.decode(Int.self, forKey: .integer)
        float = try container.decode(CGFloat.self, forKey: .float)
        string = try container.decode(String.self, forKey: .string)
        boolean = try container.decode(Bool.self, forKey: .boolean)
        integers = try container.decode([[CGFloat]].self, forKey: .integers)
        strings = try container.decode([[[String]]].self, forKey: .strings)
        try container.update(&child, forKey: .child)
    }
}
