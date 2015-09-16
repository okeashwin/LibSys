class UsersController < ApplicationController
  def view_members
    @subquery = Reservation.select("user_id,count(book_id) as reservation_count").group('user_id')
    @active_members = User.select("users.*,reservation_count").
                      joins("LEFT JOIN ((#{@subquery.to_sql}) as T) ON users.id=T.user_id").
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
end
#SELECT *, count(book_id) as reservation_count FROM `users` LEFT JOIN reservations  ON users.id=reservations.user_id WHERE (isDeleted = 0 and role & 2 > 0) GROUP BY user_id
