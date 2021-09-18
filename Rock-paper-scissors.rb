puts '何本勝負？(press 1 or 3 or 5)'
n = gets.to_i
if [1, 3, 5].include?(n)
  puts "#{n}本勝負を選びました"
else
  puts '1, 3, 5以外は入力できません'
  exit # 処理終了
end

v = 0  # 勝の初期値(forの外に書く)
d = 0  # 敗の初期値（forの外に書く）

(1..n).each do |i|
  puts "#{i}本目"
  puts 'じゃんけん…(press g or c or p)'
  x = gets.to_s.chomp # getsの改行コードを消すchompメソッド

  if x == 'g'
    puts 'あなた…グー'
  elsif x == 'c'
    puts 'あなた…チョキ'
  elsif x == 'p'
    puts 'あなた…パー'
  else # g, c, p以外を選んだ場合
    loop do
      puts 'g, c, pを選んでください'
      x = gets.to_s.chomp
      if x == 'g'
        puts 'あなた…グー'
        break
      elsif x == 'c'
        puts 'あなた…チョキ'
        break
      elsif x == 'p'
        puts 'あなた…パー'
        break
      end
    end
  end

  y = %w[g c p]
  t = y[rand(3)]
  if t == 'g'
    puts 'CPU…グー'
  elsif t == 'c'
    puts 'CPU…チョキ'
  elsif t == 'p'
    puts 'CPU…パー'
  end

  loop do # 決着が着くまで繰り返す
    if t == 'c' && x == 'g' || t == 'p' && x == 'c' || t == 'g' && x == 'p'
      puts '勝ち'
      v += 1 # v + 1 = v
      puts "#{v}勝#{d}敗"
      break # 処理終わり（loop文）

    elsif t == 'p' && x == 'g' || t == 'g' && x == 'c' || t == 'c' && x == 'p'
      puts '負け'
      d += 1 # d + 1 = d
      puts "#{v}勝#{d}敗"
      break # 処理終わり(loop文）

    else
      puts 'あいこで...(press g or c or p)'
      x = gets.to_s.chomp
      if x == 'g'
        puts 'あなた…グー'
      elsif x == 'c'
        puts 'あなた…チョキ'
      elsif x == 'p'
        puts 'あなた…パー'
      else # g,c,p以外を選んだ場合
        loop do
          puts 'g, c, pを選んでください'
          x = gets.to_s.chomp
          if x == 'g'
            puts 'あなた…グー'
            break
          elsif x == 'c'
            puts 'あなた…チョキ'
            break
          elsif x == 'p'
            puts 'あなた…パー'
            break
          end
        end
      end

      y = %w[g c p]
      t = y[rand(3)]
      if t == 'g'
        puts 'CPU…グー'
      elsif t == 'c'
        puts 'CPU…チョキ'
      elsif t == 'p'
        puts 'CPU…パー'
      end

    end
  end # 決着が着くまで繰り返す
end # each文終わり

if v > d
  puts "#{v}勝#{d}敗であなたの勝ち"
elsif v < d
  puts "#{v}勝#{d}敗であなたの負け"
end
