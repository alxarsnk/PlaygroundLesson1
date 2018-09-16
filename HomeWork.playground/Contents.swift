//: Playground - noun: a place where people can play






// Homework BY ALEXANDR ARSENYUK

import UIKit

var i: Int = 10
var str = "Hello, world"




func Trim(string: String, substring: String)->String {
    var stroka: String
    stroka = string
   
    if string.contains(substring){
    var strarr: Array<Character> = []
    var substrarr: [Character] = []
    
    for char in string{
        strarr.append(char)
    }
    for char in substring{
        substrarr.append(char)
    }
        var temp: [Int] = []
        for _ in 0..<strarr.count
      {
          temp.append(0)
        }
       for i in 0..<strarr.count{
        
         if strarr[i]==substrarr[0]{
            
            
              temp[i]=i+1// для того чтобы первый символ тоже убирался, иначе ставится ноль и //непонятно поменял его или нет, поэтому в 37 строке вычиатем 1
         if substrarr.count > 1 {
               for j in 1..<substrarr.count{
                
                if (strarr[i] == substrarr[0] && strarr[i+1] != substrarr[j] ) {
                    
                    temp[i]=0
                }
              }
            }
          }
        }
    
        var index: Range<String.Index>
       temp.reverse()
        
        for i in temp{
            if i != 0 {
            
                
                index=stroka.index(stroka.startIndex, offsetBy: i-1)..<stroka.index( stroka.startIndex, offsetBy: i+substrarr.count-1)
      
        stroka.removeSubrange(index)
                }
            }
        return stroka
        
        } else{
        return string
        
    }
}
print(Trim(string: str, substring: "o"))

//fourth try to pull request
//---------------------------------------------------------------------------------------------------
extension Int {
    static func random(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.lowerBound < 0   {
            offset = abs(range.lowerBound)
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}
//   метод генерации случайных числе я взял в интернете



class Unit {
    var dead: Bool = false
    var health: Int
    var damage: Int
    var defend: Int
    var sneaky: Int
    var nickname: String
    init(health: Int, damage: Int,  defend: Int, sneaky: Int, nickname: String) {
       self.health = health+defend
        self.damage = damage
        self.defend = defend
        self.sneaky = sneaky
        self.nickname = nickname
    }
    func attack (toEnemy: Unit){
        
        toEnemy.health=toEnemy.health-(damage*sneaky/defend)
        
    }
   
    func statusinfo() {
        
        
        if health <= 0 {
            print("The player \(nickname) is death")
            dead = true
        } else {
        print("Health of Player \(nickname) is \(health)")
        }
    }
    
}
class Maga:Unit{
    
    override init(health: Int, damage: Int, defend: Int, sneaky: Int, nickname: String) {
       
        super.init(health: health, damage: damage, defend: defend, sneaky: sneaky, nickname: nickname)
    }
    
    
}
class Knight:Unit{
    override init(health: Int, damage: Int, defend: Int, sneaky: Int, nickname: String) {
        super.init(health: health, damage: damage, defend: defend, sneaky: sneaky, nickname: nickname)
    }
    
    
}
class Assasin:Unit {
    override init( health: Int, damage: Int, defend: Int, sneaky: Int, nickname: String) {
        super.init(health: health, damage: damage, defend: defend, sneaky: sneaky, nickname: nickname)
    }
    
}
class BattleField {
    
    func isbeingBattleVersus(player1: Unit, player2: Unit){
        while player2.health > 0 || player1.health > 0 {
            player1.attack(toEnemy: player2)
            print ("\(player1.nickname) (\(player1.health)) shot into \(player2.nickname) (\(player2.health))")
            if player2.health <= 0{
                break
            }
            player2.attack(toEnemy: player1)
            print ("\(player2.nickname) (\(player2.health)) shot into \(player1.nickname) (\(player1.health))")
        }
        
        print("Battle between \(player1.nickname) and \(player2.nickname) was strong")
        if player2.health > player1.health{
        print ("The winner is \(player2.nickname) his health is \(player2.health)")
        } else {
            print ("The winner is \(player1.nickname) his health is \(player1.health)")
        }
    }
    func truebattle (list: [Unit]){
        print ("\n Let's start a fight!! \n")
        var endgame: Bool = false
        var listCopy: [Unit] = list
        
        var lost: Int = listCopy.count
        while listCopy.isEmpty == false {
            
            for i in listCopy{
                
                if listCopy.count == 1 {
                    print ("\(i.nickname) THIS IS THE WINNER with (\(i.health))")
                    endgame = true
                }else{
                print("-- \(i.nickname) ")
                }
                
            }
            if endgame == true {
                break
            }
            print("\n This guys in the game, let's continue \n \n NEXT ROUND \n ")
    
            let random1 = Int.random(range: 0..<lost)
            let random2 = Int.random(range: 0..<lost)
            let temp1: Unit = listCopy[random1]
            let temp2: Unit = listCopy[random2]
           if temp1.dead != true || temp2.dead != true{
            
            
            temp1.attack(toEnemy: temp2)
            if temp1.health <= 0 {
                print ("WTF?   \(temp1.nickname) R.I.P. he is suicide \n " )
                temp1.dead = true
                lost = lost - 1
                listCopy.remove(at: random1)
                
            }
            else if temp2.health <= 0 {
                print ("WTF?   \(temp2.nickname) R.I.P. he was killed by \(temp1.nickname)\n")
                 temp2.dead = true
                lost = lost - 1
                listCopy.remove(at: random2)
            }
            else if temp1.nickname == temp2.nickname{
              print ("Oh!    \(temp1.nickname) (\(temp1.health)) hurts himself by (\(temp1.damage)) and set his hp from (\(temp1.health+temp1.damage)) to (\(temp1.health)) \n")
            }
            else {
            print ("Look!   \(temp1.nickname) (\(temp1.health)) shot by (\(temp1.damage))  into  \(temp2.nickname) and set his health from (\(temp2.health+temp1.damage)) to (\(temp2.health))\n")
            
            }
            
            }
        }
    }
    
    
}

let u1 = Maga(health: 1000, damage: 100, defend: 200, sneaky: 100, nickname: "Alexandr")
let u2 = Assasin(health: 100, damage: 10, defend: 10, sneaky: 10, nickname: "George")
let u3 = Maga(health: 200, damage: 23, defend: 44, sneaky: 23, nickname: "Alexey")
let u4 = Knight(health: 134, damage: 44, defend: 13, sneaky: 50, nickname: "Misha")
let u5 = Assasin(health: 344, damage: 14, defend: 44, sneaky: 40, nickname: "Gleb")
let u6 = Knight(health: 314, damage: 34, defend: 13, sneaky: 49, nickname: "Kolya")

var list: [Unit] = [u1, u2, u3, u4, u5, u6]

let Ukraina = BattleField()
Ukraina.isbeingBattleVersus(player1: u1, player2: u2)

Ukraina.truebattle(list: list)



