class UsersController < ApplicationController

  def new_admin
    @admin = User.new
  end

  def create_admin

    @admin = User.where(:email => params[:email])

    if(@admin[0])
      if(@admin[0].role & User::IS_ADMIN > 0 )
        flash[:notice] = "Already an admin!! "
      else
        @admin.update_all(:role => User::IS_MEMBER | User::IS_ADMIN)
        flash[:notice] = "Added as an admin"
      end
    else
      @admin = User.new(:name => params[:name], :email => params[:email], :password=> params[:password],:isDeleted=>FALSE,:role => User::IS_ADMIN)
      #@admin = User.new(params[:admin],:isDeleted=>FALSE,:role => User::IS_ADMIN)
      @admin.save
      flash[:notice] = "Created admin" #{params[:name]}
  end
    redirect_to(:action => 'view_admins')
  end

  def view_admins

      @admins = User.where("isDeleted = ? and role & ? > 0",FALSE,User::IS_ADMIN)

  end

  def delete_admins
    del_admin = User.where( id: params[:to_be_deleted_admins])

    del_admin.each do |a|
      if (a.role & User::IS_MEMBER > 0)
        a.update(:role => User::IS_MEMBER)
      else
        reservations = Reservation.where(:user_id => a.id,:dateReturned => NIL)

        if(reservations.any?)
          flash[:notice] = "Can't Delete. Return Checked out books first!!"
        else
          a.update(:isDeleted => TRUE)
          flash[:notice] = "Delete Successful!!"

        end
      end
      #@del_admin.update_all(:isDeleted => TRUE)
    end
    redirect_to(:action => 'view_admins')
end
  def view_members
    subquery = Reservation.select("user_id,count(book_id) as reservation_count").where(:dateReturned =>nil).
                          group('user_id')
    @active_members = User.select("users.*,reservation_count").
                      joins("LEFT JOIN ((#{subquery.to_sql}) as T) ON users.id=T.user_id").
                      where("isDeleted = ? and role & ? > 0",FALSE,User::IS_MEMBER)
    @active_members.each do |m|
      if m.reservation_count == nil
        m.reservation_count=0
      end
    end
  end
  def delete_members
    del_user = User.where(id: params[:to_be_deleted_members])
    del_user.each do |m|
      if(m.role & User::IS_ADMIN >0)
        m.update(:role => User::IS_ADMIN)
      else
        user_reservation = Reservation.where(:user_id => m.id,:dateReturned => nil)
        if(user_reservation.any? )
          flash[:notice] = "Some members had reservations,they were not deleted"
        else
          m.update(:isDeleted => TRUE)
        end
      end
    end
    redirect_to action: 'view_members'
  end

  def checkouts
    @checkout_history  = Reservation.select("reservations.*,books.*").
                          where(user_id: params[:userId]).
                         joins("JOIN books ON reservations.id=books.id")
    @user = User.select(:name, :id).where(id: params[:userId])
  end

  def return
     Reservation.update( params[:id], {:dateReturned =>  Time.now.getutc})
    redirect_to action: 'checkouts', userId: params[:user_id]
    #Jugaad: passing param user_id form view to checkouts
    #change status in Book table
  end
end


