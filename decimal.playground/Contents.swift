import UIKit

var str1 = "0000123400"
var decimal1 = Decimal(string: str1 )

print("\(Int(str1) ?? 0)") //123400
print(decimal1 ?? 1)    //123400

var str2 = "00.00123400"
var decimal2 = Decimal(string: str2 )

print("\(Int(str2) ?? 0)")  //0
print(decimal2 ?? 1)  //0.001234

var str3 = ".0000123400"
var decimal3 = Decimal(string: str3 )
print("\(Int(str3) ?? 0)") //0
print(decimal3 ?? 1) //0.00001234

var str4 = "TY0000123400"
var decimal4 = Decimal(string: str4 )
print("\(Int(str4) ?? 0)") //0
print(decimal4 ?? 1) //1

var str5 = "000TYD0123400"
var decimal5 = Decimal(string: str5 )
print("\(Int(str5) ?? 0)") //0
print(decimal5 ?? 1) //0

//1. Decimal - will be Nil when the string starts with characters other than number or decimal point.
//2. Decimao - will make sure to convert a string, contains numbers and decimal point only, to be numerical combination
//3. Int - try to convert a string contains characters other than numbers will lead to a Nil.
