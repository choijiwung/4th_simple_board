class UserController < ApplicationController
  
  def index
   @users = User.all
  end

  def new
  end

  def create
    @email = params[:email]
    @password = params[:password]
    
    User.create(
      email: @email,
      password: @password
      )
  end

  def show

  end
  
  def login
    
  end
  
  def login_process
    @email = params[:email]
    @password = params[:password]
    
    #유저 인증
    user = User.find_by(email: @email)
    # 해당하는 email를 가진 user가 있다면
    if user
      #만약에 user가있다면
      if user.password == @password 
        session[:email] = user.email
        session[:id] = user.id
        flash[:notice] = "로그인이 되었습니다람쥐."
        redirect_to '/'
      else
       flash[:notice] = "비밀번호가 틀렸습니다.flash"
       @message = "비밀번호가 틀렸어요"
      end
    else
      @message = "가입을 하지 않으셨거나, 이메일 틀습니다."
    end
  end
  
  def logout
    session.clear
    flash[:notice] = "로그아웃이 되었습니다."
    redirect_to '/'
  end
  
end
