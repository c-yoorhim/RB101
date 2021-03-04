=begin
Problem 1: Cute angles
Input: floating point number
Output: string
- Write a method that takes a floating point number that represents an angle between 0 and 360 degrees
- and returns a String that represents that angle in degrees, minutes and seconds.
- You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds.
- A degree has 60 minutes, while a minute has 60 seconds.
- your results may differ slightly depending on how you round values, but should be within a second or two of the results shown in example.
- You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".
- You may use this constant to represent the degree symbol:

Data:
76.73 deg: 
76 == 76°
0.73deg == 0.73*60 = 43.8'
0.80' == 0.8*60 = 48"

deg = float
min = (float % deg) * 60)
sec = ( (min - min/1)  * 60)

round to floor of num

Algorithm:
1. convert float to deg, min, sec
2. format it with leading zero
=end

DEGREE = "\xC2\xB0"
CONVERSION = 60

def dms(num)
  return %(0#{DEGREE}00'00") if num == 0

  deg = num.floor
  min = (num % deg) * CONVERSION
  sec = (min-min.floor) * CONVERSION

  format(%(#{deg.floor}#{DEGREE}%02d'%02d"),min, sec)
end

p dms(30)# == %(30°00'00")
p dms(76.73)# == %(76°43'48")
p dms(254.6)# == %(254°36'00")
p dms(93.034773)# == %(93°02'05")
p dms(0)# == %(0°00'00")
p dms(360)# == %(360°00'00") || dms(360) == %(0°00'00")
