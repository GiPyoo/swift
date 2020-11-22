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
