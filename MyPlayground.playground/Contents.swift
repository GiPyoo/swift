//Hello, World!

print("Hello, World!");

//var vs let
//var는 변수 let은 상수!!!

var myVariable = 42;
myVariable = 50;
let myConstant = 42;


print(myVariable); //50
print(myConstant); //42


//Integer, Double.... specify the type

let implicitInteger = 70;
let implicitDouble = 70.0;
let explicitDouble : Double = 70;

print(type(of: implicitDouble)); //Double;
print(type(of: implicitInteger)); //Int;
print(type(of: explicitDouble)); //Double;

let label = "The Width is ";
let width = 94;

// let widthLabel = label + width; espected : The Width is 94 => error is String + Int not available;
// 아래와 같이 타입을 바꾸어야함 (앞에서는 타입을 예상한다 했지만 연산에서는 예상하지 못한다. 이는 선언시에만 타입을 예상하기 떼문)
let widthLabel = label + String(width); // The Width is 94

// 이렇게 타입 변환이 귀찮으니까 역슬래쉬를 이용하여 문자열 안에서 변수를 담을 수 있다.
// 자바스크립트에서 문자열 리터럴과 매우 비슷하다.

let addValue = 5;

let widthLabelLiteral = "The Width is \(width)";
// and
let widthLabelLiteral2 = "The Width is \(addValue + width)" // The Width is 99


// 스위프트에서 다음 기능은 정말 사기적인 듯하다.... 따옴펴 세 개를 연달아 사용하면 그 내부에 있는 문자열의 엔터도 인식한다.
let myName = "kiki";
let age = 25;
let quotation = """
Hello, my Name is \(myName).
and I'm \(age) years old.
"""

print(quotation);


// 스위프트에서는 키밸류 값을 가진 객체의 형태와 배열의 형태를 모두 대괄호 ([])를 이용한다.

var fruits = ["apple", "banana", "orange"];
fruits[0] = "green apple";

fruits.append("grape");

print(fruits);

var nickAndName = [
    "GiPyo" : "kiki",
    "JBJ" : "almond",
    "Jonggeun" : "dang"
];

nickAndName["Inha"] = "nina";

print(nickAndName); // 완벽.... 신기하다.

// 빈 배열이나 딕셔너리를 선언시에는 ":"을 이용하자...



// 옵셔널 변수 선언

//what is nil => wiki

var optionalValue: String? = "Hello";
print(optionalValue);

optionalValue = nil;
print(optionalValue);

// 위 방법대로 하니 노란색 경고가 나온다.
// Expression implicitly coerced from 'String?' to 'Any'
// 이 표현은 Any 타입으로 강요되었다?
//왜? => wiki
// 해결해보자

// ??로 거르기
print(optionalValue ?? "This is an optional String");
optionalValue = "Hello";
print(optionalValue ?? "This is an optional String");

// if문으로 nil 거르기.
var optionalName: String? = "GiPyo Kim"
var greeting = "Hello!"
if let name = optionalValue {
    greeting = "Hello, \(name)"
}

// 스위프트의 swich 그리고 where

let color = "blue wine";

switch color {
case let x where x.hasPrefix("red"):
    print("\(x) color is too strong");
case let x where x.hasPrefix("blue"):
    print("\(x) looks like ocean");
default:
    print("I don't know this color");
}

// for-in 구만 리터레이터 특성을 가진 객체 혹은 값을 순회하는 반복문

let studentNames = ["kiki", "nina", "cory", "juicy"];
var tempCount = 0;
for studentName in studentNames {
    if(studentName.count < 5){
        tempCount += 3;
        continue;
    }
    tempCount += 1;
}

print(tempCount); // 10


let cases = [
    "kiki" : 1,
    "nina" : 3,
    "cory" : 5
];
var largest = 0;
var largestPersonName = "";
for (name, number) in cases {
    if(number < largest){
        continue;
    }
    largest = number;
    largestPersonName = name;
}

print(largestPersonName) // cory

// while 구문.. 조건식 만큼 반복하기

var n = 2;
while n < 100 {
    n *= 2;
}
print(n) // 128

//repeat-while ==> do while이랑 비슷함

var m = 2;
repeat {
    m *= 2;
} while n < 100
print(n) // 128


// 항상 드는 생각이지만 do-while(repeat-while)문은 무조건 한 번은 실행하라라는 의미를 가지고 있는 것 같다.

// 함수!! func

func hello(person: String, day: String) -> String {
    return "Hello, \(person), today is \(day)";
}

hello(person: "kiki", day: "Monday");

// 함수 변수에 별명을 지을 수 있다. "_"는 이름없이 변수를 담게 해준다.
func hello2(_ person: String, on day: String) -> String {
    return "Hello, \(person), today is \(day)";
}

hello2("kiki", on: "Monday");

// 튜플을 사용하여 여러개의 값을 리턴 시킬 수 있다.. 튜플은 순서가 없는 집합으로 알고 있다.

let tuples = (name: "kiki", age: 26);

print(tuples.name);
print(tuples.1);

//튜플 리턴 함수.. 함수 리턴 형식으로 안성맞춤인 것 같다.

func calculateStatistics(scores: [Int]) -> (min: Int, max:Int, sum:Int) {
    var min = scores[0];
    var max = scores[0];
    var sum = 0;
    
    for score in scores {
        if(score > max){
            max = score;
        }
        if(score < min){
            min = score;
        }
        sum += score;
    }
    
    return (min,max,sum);
}

let statics = calculateStatistics(scores: [7,3,23,5,29,2,17,13,11]);
print(statics.min);
print(statics.1);
print(statics.sum);

// 바깥 함수의 변수를 참조할 수 있음 => Nested, 선언지 변수를 기억한다는 점에서 클로져?의 특성을 보임

func counter() ->  (()->Int) {
    var count = 0;
    
    func add() -> Int{
        count += 1;
        return count;
    }
    
    return add;
}

let increase = counter();

print(increase());
print(increase());
print(increase());
print(increase());

//일급객체로서의 함수

func domappingInt(list: [Int], map: ((Int) -> Int)) -> [Int] {
    var temp : [Int] = [];
    for item in list {
        temp.append(map(item));
    }
    return temp;
}

let numbers2 = [1,2,3,4,5,6];

func multipletwo(number : Int) -> Int {
    return number * 2;
}

print(domappingInt(list: numbers2, map: multipletwo));

// Array의 기본함수 map

let newNumbers = numbers2.map({(number:Int)->Int in number * 2});
print(newNumbers)


// object and class

class Destination {
    var distance = 0;
    func leftTo() -> String {
        return "the distance remaining to destination is \(distance)km.";
    }
}

//new 키워드를 쓰지 않아도 생성된다???!!
var destination = Destination();
destination.distance = 10;
var destDescription = destination.leftTo();


class Person {
    var age: Int;
    var name: String;
    
    // constructor가 스위프트에서는 init이다.
    init(name: String, age: Int) {
        self.age = age;
        self.name = name
    }

    func callMe() -> String {
        return "Hello. I'm \(name), I'm \(age) years old."
    }
}

// 상속이 신기하다..
class Doctor : Person {
    var subject: String;
    
    init(subject : String,name: String,age : Int) {
        self.subject = subject;
        super.init(name: name, age: age);
    }
    
    override func callMe() -> String {
        return "Hello. I'm \(name), I'm \(age) years old. And I'm Doctor that vets \(subject)"
    }
}

let doc = Doctor(subject: "NeuroSurgery", name: "Jason", age: 45);
doc.callMe();



class Teacher : Person {
    var subject: String;
    var student: String;
    init(subject : String,name: String,age : Int) {
        self.subject = subject;
        self.student = "";
        super.init(name: name, age: age);
    }
    
    var studentName: String {
        get {
            return student;
        }
        set{
            student = "S. " + newValue;
        }
    }
    
    override func callMe() -> String {
        return "Hello. I'm \(name), I'm \(age) years old. And I'm Teacher that teach about \(subject)"
    }
}

let teacher = Teacher(subject: "Math", name: "Julia", age: 37);

teacher.studentName = "Jacop";

print(teacher.student);

//willSet을 이용해 객체가 생성된 후 생성됬을 때를 예상해서 데이터를 할당 받을 수 있다.
// 아래클래스들은 swift tour 들을 긁어왔다.
class Shape{
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }
}


class Square: Shape{
    var sideLength: Double
    
    init(sideLength:Double, name: String) {
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 4;
    }
    
    func area() -> Double {
        return sideLength * sideLength;
    }
}

class EquilateralTriangle: Shape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
}

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength;
        }
    }
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength;
        }
    }
    
    init(size: Double, name:String) {
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name);
    }
}


// 값을 할당할 때바다 값이 바뀌는 것을 확인할 수 있다.
var triSquare = TriangleAndSquare(size: 10,name:"shape");
print(triSquare.square.sideLength); //10
print(triSquare.triangle.sideLength);// 10

triSquare.square = Square(sideLength: 11, name: "another");
print(triSquare.triangle.sideLength); //11


//이런 클래스들 또한 옵셔널로 사용가능하다.
//특이한 점은 willSet이라는 것의 존재여부다 이를 조금 자세히 공부해봐야겠다.

// Enumerations and Structures
// enum?은 무엇일까. 내가 생각하는 enum은 순서없는 개체들의 집합으로 알고 있다.

enum Trump : Int{
    case ace = 1;
    case two, three, four, fice, six, seven, eight, nine, ten;
    case jack, queen, king;
    
    static let order = [ace, two, three, four, fice, six, seven, eight, nine, ten, jack, queen, king];
    
    func explicateSpecialCase() -> String {
        switch self {
        case .ace:
            return "ace";
        case .jack:
            return "jack";
        case .queen:
            return "queen";
        case .king:
            return "king";
        default:
            return String(self.rawValue)
        }
    }
}

// rawValue 를 원시값이라 한다. 이것은 무엇일까? => 위키에 정리
let ace = Trump.ace
let aceRawValue = ace.rawValue;

if let convertedTrump = Trump(rawValue: 3){
    let threeD = convertedTrump.explicateSpecialCase();
    print(threeD);
}

enum TrumpShape {
    case spades, hearts, diamonds, clubs;
    
    static let order = [spades, diamonds, clubs, hearts];
    
    func dsecription() -> String {
        switch self {
        case .spades:
            return "spades";
        case .hearts:
            return "hearts";
        case .diamonds:
            return "diamonds";
        case .clubs:
            return "clubs";
        }
    }
    
    func color() -> String {
        switch self {
        case .clubs:
            return "black";
        case .spades:
            return "black";
        default:
            return "red";
        }
    }
}

let hearts = TrumpShape.hearts;
let hertDescription = hearts.dsecription();
let heartsColor = hearts.color();

enum ServerResponse {
    case result(String,String);
    case failure(String);
    case pending(String);
}

let success = ServerResponse.result("6:00 am", "8:09 pm");
let failure = ServerResponse.failure("Out of cheese.");
let pending = ServerResponse.pending("20");

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)");
case let .failure(message):
    print("Failure... \(message)");
case let .pending(waitTime):
    print("Pending... wait for \(waitTime) seconds");
}

switch failure {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)");
case let .failure(message):
    print("Failure... \(message)");
case let .pending(waitTime):
    print("Pending... wait for \(waitTime) seconds");
}

switch pending {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)");
case let .failure(message):
    print("Failure... \(message)");
case let .pending(waitTime):
    print("Pending... wait for \(waitTime) seconds");
}


//struct에 대해 알아보자
// struct는 class와 비슷한 행동을 하고 제공해준다. 메스드와 선언자들을 포함하고 가장 중요한 클래스와의 차이점은 스트럭텨는 항상 카피가 된가는 것이다. 하지만 클래스는 참조 된다.
struct Card {
    var trump : Trump;
    var shape : TrumpShape;
    
    func  description() -> String {
        return "The \(trump.explicateSpecialCase()) of \(shape.dsecription()), it's color is \(shape.color())."
    }
}

let threeOfSpades = Card(trump: .three, shape: .spades);
let threeOfSpadesDescription = threeOfSpades.description();



func makeDeck() -> [Card] {
    var oneCardSet : [Card] = [];
    for (shape) in TrumpShape.order{
        for (data) in Trump.order{
            oneCardSet.append(Card(trump: data, shape: shape))
        }
    }
    return oneCardSet;
}

makeDeck().forEach({(card : Card) -> Void in print(card.description())});

//protocol? 과 extentionsd

protocol ExampleProtocol {
    var simpleDescription: String {get};
    var simpleNumber: Int {get};
    mutating func adjust();
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var simpleNumber: Int = 54;
    var anotherProperty: Int = 24601;
    func adjust(){
        simpleDescription += " Now 100% adjusted";
    }
}

var a = SimpleClass();
a.adjust();
let aDescription = a.simpleDescription;

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure";
    var simpleNumber: Int = 30;
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure();
b.adjust();
let bDescripttion = b.simpleDescription;

// 구조체는 구조체를 변경하기 위해 함수에 mutationg 키워드를 달지만 클래스는 항상 내부를 스스로 수정할 수 있기 때문에 이 키워드가 필요없다.
// 여기서 프로토콜은 다른 언어의 인터페이스와 비슷한 모습이 있고 구조체에도 적용되는 것 같다.

extension Int: ExampleProtocol{
    var simpleNumber: Int {
        return self;
    }
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    //뮤터블 오류가 남 self 자체를 바꾸는 것이 불가능해 보임
    //바로정수에서 사용은 불가능 다만 변수에 저장한 변수는 가능
    mutating func adjust() {
        self += 42;
    }
}
var abc = 7;

abc.adjust();
7.simpleNumber;
7.simpleDescription;

let protocolValue: ExampleProtocol = a;
print(protocolValue.simpleDescription)

extension Double{
    var absoluteValue: Int{
        return abs(Int(self));
    }
}

-7.9.absoluteValue
