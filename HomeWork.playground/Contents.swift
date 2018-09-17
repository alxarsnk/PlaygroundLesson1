//: Playground - noun: a place where people can play






// Homework BY ALEXANDR ARSENYUK

import UIKit

var i: Int = 10
var str = "Hello, world"




func trim(_ string: String, with substring: String) -> String {
    var currentString: String
    currentString = string
   
    if string.contains(substring) {
    var stringsArray: [Character] = []
    var substringsArray: [Character] = []
    
        string.forEach { stringsArray.append($0) }
        substring.forEach { substringsArray.append($0) }
        var temp: [Int] = []
        for _ in 0..<stringsArray.count {
          temp.append(0)
        }
        for index in 0..<stringsArray.count {
          if stringsArray[index] == substringsArray[0] {
              temp[index] = index + 1
              if substringsArray.count > 1 {
               for anotherIndex in 1 ..< substringsArray.count {
                if (stringsArray[index] == substringsArray[0] && stringsArray[index + 1] != substringsArray[anotherIndex] ) {
                    temp[index] = 0
                }
              }
            }
          }
        }
        var index: Range<String.Index>
        temp.reverse()
        
        for number in temp {
            if number != 0 {
                index = currentString.index(currentString.startIndex, offsetBy: number - 1) ..< currentString.index(currentString.startIndex, offsetBy: number + substringsArray.count - 1)
                currentString.removeSubrange(index)
                }
            }
        return currentString
        }
        else {
        return string
        
    }
}
print(trim(str, with: "o"))


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
    var isDead: Bool = false
    var health: Int
    var damage: Int
    var defend: Int
    var sneaky: Int
    var wins: Int = 0
    var loses: Int = 0
    var nickname: String
     init (health: Int, damage: Int,  defend: Int, sneaky: Int, nickname: String) {
        self.health = health+defend
        self.damage = damage
        self.defend = defend
        self.sneaky = sneaky
        self.nickname = nickname
    }
    func attack (toEnemy: Unit) {
        toEnemy.health=toEnemy.health-(damage*sneaky/defend)
        wins += 1
        toEnemy.loses += 1
     }
    func statusinfo() {
        if health <= 0 {
            print("The player \(nickname) is death")
            isDead = true
        } else {
         print("Health of Player \(nickname) is \(health)")
        }
    }
}

class Maga:Unit {
    override init(health: Int, damage: Int, defend: Int, sneaky: Int, nickname: String) {
        super.init(health: health, damage: damage, defend: defend, sneaky: sneaky, nickname: nickname)
    }
}

class Knight:Unit {
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
    func battleBetweenTwoPlayers(player1: Unit, player2: Unit) {
        while player2.health > 0 || player1.health > 0 {
            player1.attack(toEnemy: player2)
            print ("\(player1.nickname) (\(player1.health)) shot into \(player2.nickname) (\(player2.health))")
            if player2.health <= 0 {
                break
            }
            player2.attack(toEnemy: player1)
            print ("\(player2.nickname) (\(player2.health)) shot into \(player1.nickname) (\(player1.health))")
        }
        
        print("Battle between \(player1.nickname) and \(player2.nickname) was strong")
        if player2.health > player1.health {
        print ("The winner is \(player2.nickname) his health is \(player2.health)")
        } else {
            print ("The winner is \(player1.nickname) his health is \(player1.health)")
        }
    }
    func multiplayerBattle (units: [Unit]) {
        print ("\n Let's start a fight!! \n")
        var winRatingList: [Int] = []
        units.forEach { _ in winRatingList.append(0) }
        var loseRatingList: [Int] = []
        units.forEach { _ in loseRatingList.append(0) }
        var isGameEnd: Bool = false
        var unitsCopy: [Unit] = units
        var unitsCopyCount: Int = unitsCopy.count
        var top1: Int = -100
        var top1Name: String = " "
        var top2: Int = -100
        var top2Name: String = " "
        var top3: Int = -100
        var top3Name: String = " "
        while !unitsCopy.isEmpty  {
             for unit in unitsCopy {
                if unitsCopy.count == 1 {
                    print ("\(unit.nickname) THIS IS THE WINNER with (\(unit.health)) \n")
                    print( " It's time to status \n ")
                    for unit in units {
                      print ("Wins of \(unit.nickname)  --  \(unit.wins) and his loses -- \(unit.loses) ")
                    }
                    print("TOP 3 OF PLAYERS")
                    for unit in units {
                        if unit.wins - unit.loses > top1 {
                            top1 = unit.wins - unit.loses
                            top1Name = unit.nickname
                        }
                        
                    }
                    for unit in units {
                        if unit.wins - unit.loses > top2 && unit.wins - unit.loses < top1 {
                            top2 = unit.wins - unit.loses
                            top2Name = unit.nickname
                        }
                        
                    }
                    for unit in units {
                        if unit.wins - unit.loses > top3 && unit.wins - unit.loses < top2 {
                            top3 = unit.wins - unit.loses
                            top3Name = unit.nickname
                        }
                        
                    }
                    print (" TOP1 \(top1Name) -- \(top1) \n TOP2 \(top2Name) -- \(top2) \n TOP3 \(top3Name) -- \(top3) ")
                    
                    isGameEnd = true
                }
                else {
                 print("-- \(unit.nickname) ")
                }
             }
            if isGameEnd {
                break
            }
            print("\n This guys in the game, let's continue \n \n NEXT ROUND \n ")
            let random1 = Int.random(range: 0..<unitsCopyCount)
            let random2 = Int.random(range: 0..<unitsCopyCount)
            let temp1: Unit = unitsCopy[random1]
            let temp2: Unit = unitsCopy[random2]
            if !temp1.isDead || !temp2.isDead {
             temp1.attack(toEnemy: temp2)
              if temp1.health <= 0 {
                
                print ("WTF?   \(temp1.nickname) R.I.P. he is suicide \n " )
                temp1.isDead = true
                unitsCopyCount  -= 1
                unitsCopy.remove(at: random1)
             }
              else if temp2.health <= 0 {
                
                 print ("WTF?   \(temp2.nickname) R.I.P. he was killed by \(temp1.nickname)\n")
                 temp2.isDead = true
                 unitsCopyCount -= 1
                 unitsCopy.remove(at: random2)
            }
              else if temp1.nickname == temp2.nickname {
                
                print ("Oh!    \(temp1.nickname) (\(temp1.health)) hurts himself by (\(temp1.damage)) and set his hp from (\(temp1.health+temp1.damage)) to (\(temp1.health)) \n")
            }
              else {
                
                print ("Look!   \(temp1.nickname) (\(temp1.health)) shot by (\(temp1.damage))  into  \(temp2.nickname) and set his health from (\(temp2.health+temp1.damage)) to (\(temp2.health))\n")
                winRatingList[random1] += 1
                loseRatingList[random2] += 1
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
let u7 = Maga(health: 200, damage: 50, defend: 50, sneaky: 50, nickname: "Danis")
let u8 = Assasin(health: 400, damage: 100, defend: 100, sneaky: 100, nickname: "Danis")

var list: [Unit] = [u1, u2, u3, u4, u5, u6, u7, u8]

let ukraina = BattleField()
ukraina.battleBetweenTwoPlayers(player1: u1, player2: u2)
ukraina.multiplayerBattle(units: list)




