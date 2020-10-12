full_names = %w(
坪井麻理
前島俊章
村田弘明
小森晃子
大森広志
梅田満里奈
関力
矢部保
大平末治
小沼優那
吉田勇次
寺沢功一
小堀奏多
古河幸真
上杉明子
金丸美帆
坂井圭二
石坂正敏
志賀勝美
水田広
亀田悠菜
井手喜三郎
田端夏鈴
石山貫一
岡野夏帆
五味達男
足立実咲
冨永茂雄
田上正彦
竹中実桜
栗本優美
富岡陽治
新保正三
広川肇
黒澤伸一
大貫亜抄子
大場充
関本弘子
田村基一
関口静江
)

names = %w(
Mari
Toshiaki
Hiroaki
Akio
Hiroshi
Marina
Chikara
Tamotsu
Sueji
Yuuna
Yuuji
Kouichi
Souta
Yukimasa
Akiko
Miho
Keiji
Masatoshi
Katsumi
Hiroshi
Yuuna
Kisaburou
Karin
Kanichi
Kaho
Tatsuo
Misaki
Shigeo
Masahiko
Mio
Yumi
Youji
Shouzou
Hajime
Shinichi
Asako
Mitsuru
Hiroko
Kiichi
Shizue
)

sexes = %w(
2
1
1
2
1
2
1
1
1
2
1
1
1
1
2
2
1
1
2
1
2
1
2
1
2
1
2
1
1
2
2
1
1
1
1
2
1
2
1
2
)



birthdays = %w(
1975/08/11
1981/11/09
1969/03/31
1966/09/18
1987/08/03
1970/08/05
1970/11/30
1991/12/27
1990/04/14
1975/04/27
1978/10/05
1997/08/08
1995/05/03
1966/07/29
1966/07/31
1989/05/06
1995/07/28
1978/11/08
1977/08/01
1983/01/14
1979/05/17
1989/10/21
1999/06/14
1976/01/08
1967/04/11
1968/02/28
1966/12/12
1981/05/23
1995/04/26
1976/12/16
1983/09/18
1991/05/03
1990/01/10
1980/01/31
1982/10/16
1975/07/22
1962/01/08
1982/02/19
1976/04/07
1969/12/30
)

0.upto(sexes.size - 1) do |idx|
  Member.create(
    number: idx+1 ,
    name: names[idx],
    full_name: full_names[idx],
    email: "#{names[idx]}#{idx+1}@example.com",
    birthday: birthdays[idx],
    sex: sexes[idx],
    administrator: (idx == 0),
    password: "asagao!",
    password_confirmation: "asagao!"
  )
end


filename = "profile.png"
path = Rails.root.join(__dir__,filename)
m = Member.find_by!(sex: 1)

File.open(path) do |f|
  m.profile_picture.attach(io: f, filename: filename)
end

# 0.upto(29) do |idx|
#   Member.create(
#     number: idx + 20,
#     name: "John#{idx + 1}",
#     full_name: "John Doe#{idx + 1}",
#     email: "John#{idx+1}@example.com",
#     birthday: "1981-12-01",
#     sex: 1,
#     administrator: false,
#     password: "password",
#     password_confirmation: "password"
#   )

# end
