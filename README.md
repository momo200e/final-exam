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
    
記得重開rails server唷 ~~~~

這樣就完成導入囉~
  
### Step.3 scaffold建立studentCRUD

```rails
rails g scaffold student name student_id:integer grade: integer
```
`rails db:migrate`


### Step.4 畫面美化
**畫面內容**
```rails
#layouts/application.html.erb
<div class="container">
<%= yield %>  
</div>
```
用`<div class="container">`包著內文

**表格美化**
```rails
#student/index.html.erb
<h1>成績列表</h1>
<%= link_to '新增學生', new_student_path, class="" %>

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
        <td><%= student.integer %></td>
        <td><%= link_to '編輯', edit_student_path(student) %></td>
        <td><%= link_to '刪除', student, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>


```
