require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
 
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

#ファイルの新規作成処理
if memo_type == 1
    puts "拡張子を除いたファイルを入力してください"
    csv_file_name = gets.chomp + ".csv"
  
    p "メモしたい内容を記入してください"
    p "完了したらCtrl + Dを押してください"  
    new_memos = []
    while (memo_line = gets)
        new_memos << memo_line.chomp
    end
  
    CSV.open(csv_file_name, "w") do |csv|
        new_memos.each do |memo|
            csv << [memo]
        end
    end
#ファイルの編集処理
elsif memo_type == 2
    puts "編集したいファイル名（拡張子を除いて）を入力してください"
    csv_file_name = gets.chomp + ".csv"
    
    if File.exist?(csv_file_name)
        p "現在のメモ内容は以下です"
        file_content = File.readlines(csv_file_name)
        file_content.each do |line|
            puts line.chomp
        end
    
        p "新しいメモ内容を入力してください"
        p "完了したらCtrl + Dを押してください" 
        new_memos = []
        while (memo_line = gets)
            new_memos << memo_line.chomp
        end
    
        CSV.open(csv_file_name, "a") do |csv|
            new_memos.each do |memo|
                csv << [memo]
            end
        end

    else
        puts "ファイルが見つかりませんでした。"
    end
#ユーザーが1か2以外を入力した場合、再入力を促す
else
    p "1か2を入力してください"
end
