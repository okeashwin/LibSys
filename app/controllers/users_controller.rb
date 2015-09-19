class UsersController < ApplicationController

  def new_admin
    @admin = User.new
  end

  def create_admin

    puts params[:admin]

     @admin = User.new(:name => params[:name], :email => params[:email], :password=> params[:password],:isDeleted=>FALSE,:role => User::IS_ADMIN)
    #@admin = User.new(params[:admin],:isDeleted=>FALSE,:role => User::IS_ADMIN)
    @admin.save
    redirect_to(:action => 'view_admins')
  end

  def view_admins

      @admins = User.where(:isDeleted => FALSE,:role => User::IS_ADMIN)

  end

  def delete_admins
    @del_admin = User.where( id: params[:to_be_deleted_admins])
    @del_admin.update_all(:isDeleted => TRUE)
    flash[:notice] = "Delete Successful!!"
    redirect_to(:action => 'view_admins')
  end
end
