### Ruby 題

1. 試說明在 Ruby 裡常數(constant)跟變數(variable)的差別。

    - constant：開頭大寫的變數就是常數，在Rails當中，任何model、class、module的名稱都是常數
    - variable：在變數命名規則上，通常會使用英文字母、數字或底線的組合，或是非英文字也可以，如日文。

2. 請問 `hash[:key]` 跟 `hash["hash"]` 有什麼差別?
    - hash["hash"]會得到空
    - hash[:key]才能正確拿到值
3. 如果要在 1 到 100 的數字當中，任意取出 5 個不重複的亂數，你會怎麼做？
    - puts [1..100].to_a.sample(5)
4. 試說明在 Ruby 裡 `public`、`protected` 與 `private` method 的差別。
    - public就是在所有地方都可以直接存取，private是只有在類別內部才可以存取；而protected差不多是在這兩者之間。

### Rails 題

1. 請任意舉出三個你在開發 Rails 專案時常用到的 gem，並說明你覺得這些 gem 厲害的地方或是你為什麼採用它們的原因。

    - [Bootstrap-sass](https://github.com/momo200e/Ruby_Rails_Notes/blob/master/Gem_Notes.md#bootstrap-sass)：這個框架是我開發php網站最常用，也是最容易用的，方常方便
  
    - [Devise會員機制](https://github.com/momo200e/Ruby_Rails_Notes/blob/master/Gem_Notes.md#devise會員機制)：這個框架是我學RAILS以來其中幾個最讓我驚訝的GEM，有了Devise，實作使用者機制變成一件再容易不過的事，馬上可以長出登入登出，如果再搭配cancancan那就太狂了XD
  
    - [Awesome_print](https://github.com/momo200e/Ruby_Rails_Notes/blob/master/Gem_Notes.md#awesome_print)：awesome_print是一個可以將Ruby的console輸出排版好看一點的外掛，因為我常常用到console來練習，所以排版很重要，不然會瞎掉XDD
 
2. 請問 `User.find_by(id: 1)` 跟 `User.find(1)` 這兩個寫法有什麼差別?

    - User.find(1)    # 有的話會傳回User.id=1的物件,無的話會噴錯

    - User.find_by(id: 1) #有的話會傳回User.id=1的物件,無的話會傳nil

3. Gemfile 裡 `gem 'sass-rails', '~> 4.0.3'` ，後面的 `"~> 4.0.3"` 是代表什麼意思?
    - 版本問題，如果沒打，那`bundle install`就會幫你妝最穩的版本
4. 請簡述什麼是 N+1 問題? 又該怎麼解決它?
    - 意思是我們在迴圈當中大量`select x`查詢N筆資料，再加上開頭查詢的那1筆，稱為N+1。
        
        **這樣非常的多於浪費，身為後端開發者，查詢資料庫的次數是越少越好。**

     解決：includes 可以直接將相關連的資料，在同一筆查詢，一起撈出來

### Git 題

1. 空的資料夾無法被加入 Git 版控，但這個資料夾如果又是很重要的資料夾，你會怎麼處理?
2. 在 Rails 專案中，`/config/database.yml` 這個檔案裡有資料庫的設定、帳號密碼等資訊，在使用 Git 時，你通常會怎麼處理這類型內容比較敏感的檔案?
