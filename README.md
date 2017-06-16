# 期中考

- [系統功能](#系統功能頁面)
- [MODEL設計](#model設計)
- [技術運用(Gem)](#技術運用gem)
- [實作](#開始實作)
  - [Step.1 建立專案](#step1-建立my_store專案)
  
  - [Step.2 加入gem套件](#step2-加入gem套件)
  
  - [Step.3 scaffold建立CRUD](#step3-scaffold建立studentcrud)
  
  - [Step.4 畫面美化](#step4-畫面美化)

  - [Step.5 顯示等第](#step5-成績等第)
 

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
    
記得重開rails server唷 ~~~~

這樣就完成導入囉~
  
### Step.3 scaffold建立studentCRUD

```ruby
rails g scaffold student name student_id:integer grade:integer
```
`rails db:migrate`


### Step.4 畫面美化
**畫面內容**
```ruby
#layouts/application.html.erb
<div class="container">
<%= yield %>  
</div>
```
用`<div class="container">`包著內文

**表格美化**
表格標籤加上`class="table"`
```ruby
#student/index.html.erb
<h1>成績列表</h1>

<%= link_to '新增學生', new_student_path, class:"btn btn-success"  %>


<table class="table">
  <thead>
    <tr>
      <th>姓名</th>
      <th>學號</th>
      <th>分數</th>
      <th>處理</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @students.each do |student| %>
      <tr>
        <td><%= student.name %></td>
        <td><%= student.student_id %></td>
        <td><%= student.grade %></td>
        <td><%= link_to '編輯', edit_student_path(student), class:"btn btn-primary"  %></td>
        <td><%= link_to '刪除', student, method: :delete, data: { confirm: 'Are you sure?' }, class:"btn btn-danger" %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

```
**按鈕美化**
- 綠色按鈕加上`class:"btn btn-success"`
- 藍色按鈕加上`class:"btn btn-primary"`
- 紅色按鈕加上`class:"btn btn-danger"`

**依老師題目來說按鈕是小按鈕btn-xs**
```ruby
#layouts/application.html.erb
 <td><%= link_to '編輯', edit_student_path(student), class:"btn btn-primary"  %></td>
 <td><%= link_to '刪除', student, method: :delete, data: { confirm: 'Are you sure?' }, class:"btn btn-dange
```

**老師還有把scaffold長出來的SCSS砍掉，其中bootstrap中的字體改微軟正黑體，時間關係，這不再此做過多說明**

### Step.5 成績等第
**畫面內容**
```ruby
#student/index.html.erb
<hr>
<P>分數級別說明：90分以上S/80~89：A/70~79：B/60~69：C級/未滿60：D級</P>
```
**MODEL**
```ruby
#student.rb
<hr>
<P>分數級別說明：90分以上S/80~89：A/70~79：B/60~69：C級/未滿60：D級</P>
```

**接下來 我們要用龍哥教我們的Rails 程式碼整理術**
顯示的這部份不建議直接寫在view，要寫在Helper
```ruby
# 檔案：app/helpers/students_helper.rb
def print_grade(student)
      if student.grade.to_i >= 90
        "S級(#{student.grade})"
      elsif student.grade >= 80 && student.grade < 90
        "A級(#{student.grade})"
     
      elsif student.grade >= 70 && student.grade < 80
        "B級(#{student.grade})"
     
      elsif student.grade >= 60 && student.grade < 70
        "C級(#{student.grade})"

      else
        "D級(#{student.grade})"
      end
      
  end
```
這邊會有一些小問題，會說找不到方法。。。
如果把=拿掉又會正常
```ruby
def print_grade(student)
   if student.grade.to_i > 90
        "S級(#{student.grade})"
      elsif student.grade > 80 
        "A級(#{student.grade})"
     
      elsif student.grade > 70 
        "B級(#{student.grade})"
     
      elsif student.grade > 60 
        "C級(#{student.grade})"

      else
        "D級(#{student.grade})"
      end
end
```
我可能還需要時間找一下

那原本的地方，要改這樣
```ruby
#student/index.html.erb
<td><%= print_grade(student) %></td>
```
