class UserController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vova',
        username: 'transfer',
        avatar_url: ''
        ),
      User.new(
        id: 2,
        name: 'Misha',
        username: 'aristofan'
       )
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Vova',
      username: 'transfer')

    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('01.01.0001')),
      Question.new(text: 'Вчем смысл?', created_at: Date.parse('01.01.0001')),
      Question.new(text: 'В чем правда, брат?', created_at: Date.parse('01.01.0001')),
      Question.new(text: 'Почем нынче фунт лиха?', created_at: Date.parse('01.01.0001')),
      Question.new(text: 'Ты где?', created_at: Date.parse('01.01.0001'))
    ]

    @new_question = Question.new
  end
end
