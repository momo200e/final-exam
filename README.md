# 期中考

- [系統功能](#系統功能頁面)
- [MODEL設計](#model設計)
- [技術運用(Gem)](#技術運用gem)
- [實作](#開始實作)
  - [Step.1 建立專案](#step1-建立my_store專案)
  
  - [Step.2 加入gem套件](#step2-加入gem套件)
  
  - [Step.3 scaffold建立CRUD](#step3-scaffold建立studentcrud)
  
  - [Step.4 畫面美化](#step4-畫面美化)
 

## 系統功能(頁面)
 
 
- 學生成績CRUD



## MODEL設計

**student 學生資料表**

 - name: String   
 - student_id: integer   
 - grade: integer




 

 
## 技術運用(Gem)
  - bootstrap
  - simple_form

## 開始實作~

### Step.1 建立grade專案
  `rails new grade`
  
### Step.2 加入gem套件

**[Bootstrap-sass](https://github.com/momo200e/Ruby_Rails_Notes/blob/master/Gem_Notes.md#bootstrap-sass) && [Simple_form](https://github.com/momo200e/Ruby_Rails_Notes/blob/master/Gem_Notes.md#simple_form)**


`cd grade`進入專案目錄後
```ruby
#Gemfile
gem 'bootstrap-sass'
gem 'simple_form'
``` 
終端機中執行`bundle install`

```ruby
#application.scss
@import "bootstrap-sprockets";
@import "bootstrap";
#application.js
//= require bootstrap
``` 
因為要搭配bootstrap使用，所以使用`rails generate simple_form:install --bootstrap`
    

  
這樣就完成導入囉~
  
### Step.3 scaffold建立studentCRUD

```rails
rails g scaffold student name student_id:integer grade: integer
```


### Step.4 畫面美化
未完待續。。。
