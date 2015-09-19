class UsersController < ApplicationController
  def view_members
    subquery = Reservation.select("user_id,count(book_id) as reservation_count").group('user_id')
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
    del_user.update_all(isDeleted: TRUE)
    redirect_to action: 'view_members'
  end
  def checkouts
    @checkout_history  = Reservation.select("reservations.*,books.*").
                          where(user_id: params[:userId]).
                         joins("JOIN books ON reservations.id=books.id")
    @user = User.select(:name, :id).where(id: params[:userId])
    @user.inspect
  end

end

