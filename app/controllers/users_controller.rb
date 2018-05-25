class UsersController < ApplicationController

  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id]) 
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  # Crear users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User ha sido guardado correctamente."
    else
      render :new
    end
  end

  # Actualizar users
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: "Users ha sido actualizado."
    else
      render :edit
    end
  end
  
  # Borrar users
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "Users ha sido borrado."
  end

  private
    # Definir cuales atributos se pueden ver en los form
    def user_params
      params.require(:user).permit(:name, :family_goal_ids => [])
    end


end