##define##

#リセット
def reset
  judge_hand = 0
  error = 0
end

#じゃんけん掛け声
def start_words
  puts "じゃんけん..."
  puts "0(グー) 1(チョキ) 2(パー) 3(やめる)"
end

#あっち向いて掛け声
def direction_words
  puts "あっちむいて〜"
  puts "0(上) 1(下) 2(左) 3(右)"
end

#あっち向いて判定&勝敗判定
def direction_and_judge(judge)
  judge_hand = judge
  direction_words()
  your_direction = gets.to_i
  opponent_direction = rand(4)
  
  if your_direction == 0
    puts "あなた：上"
  elsif your_direction == 1
    puts "あなた：下"
  elsif your_direction == 2
    puts "あなた：左"
  elsif your_direction == 3
    puts "あなた：右"
  else
    puts "エラーが発生しました"
    error = 1
  end
  
  if error != 1
    if opponent_direction == 0
      puts "相手：上"
      puts "------------------"
    elsif opponent_direction == 1
      puts "相手：下"
      puts "------------------"
    elsif opponent_direction == 2
      puts "相手：左"
      puts "------------------"
    else
      puts "相手：右"
      puts "------------------"
    end
  else
  end
  
  #負け→一致あり
  if your_direction == opponent_direction && judge_hand == 2
    puts "負け！"
    puts "------------------"
  #勝ち→一致あり
  elsif your_direction == opponent_direction && judge_hand == 3
    puts "勝ち！"
    puts "------------------"
  #一致なし
  else
  end
end

###main##
start_words()
your_hand = gets.to_i

judge_hand = 0
error = 0

while your_hand != 3 do
  
  if judge_hand == 1
    puts "ショ！"
    puts "------------------"
  else
    puts "ポン！"
    puts "------------------"
  end

  if your_hand == 0
    puts "あなた：グーを出しました"
    
  elsif your_hand == 1
    puts "あなた：チョキを出しました"
    
  elsif your_hand == 2
    puts "あなた：パーを出しました"
  
  else
    puts "エラーが発生しました"
    error = 1
    if error == 1
      break
    end
  end

  opponent_hand = rand(3)


  if opponent_hand == 0
    puts "相手：グーを出しました"
    puts "------------------"
    
  elsif opponent_hand == 1
    puts "相手：チョキを出しました"
    puts "------------------"
    
  elsif opponent_hand == 2
    puts "相手：パーを出しました"
    puts "------------------"
    
  end
  
  #じゃんけん　あいこ
  if your_hand == opponent_hand
    judge_hand = 1
    puts "あいこで〜"
    puts "0(グー) 1(チョキ) 2(パー) 3(やめる)"
    your_hand = gets.to_i
  
  #じゃんけん　負け
  elsif your_hand - opponent_hand == 1 || your_hand - opponent_hand == -2
    judge_hand = 2
    direction_and_judge(judge_hand)
    
  #次戦準備
    if error != 1
      start_words()
      your_hand = gets.to_i
      reset()
    else
      break
    end
    
  #じゃんけん　勝ち
  else
    judge_hand = 3
    direction_and_judge(judge_hand)
    
  #次戦準備
    if error != 1
      start_words()
      your_hand = gets.to_i
      reset()
    else
      break
    end
  end
  
end

#終了表示
puts "終了します"