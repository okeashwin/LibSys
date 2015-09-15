class UsersController < ApplicationController
  def view_members

    # @active_members = User.select("users.*, sum(book_id) as reservation_count")
    #                       .joins(:reservations)
    #                       .group('.user_id').
    #                        where("isDeleted = ? and role & ? > 0",FALSE,User::IS_MEMBER)
    @active_members = User.select("users.*, count(book_id) as reservation_count").
                      joins("LEFT OUTER JOIN reservations  ON users.id=reservations.user_id").
                      group('user_id').
                      where("isDeleted = ? and role & ? > 0",FALSE,User::IS_MEMBER)
    #@active_members = User.all(:select => "users.*, count(reservations.book_id) as book_count", :joins => :reservations, :group => "reservations.user_id")

    #Reservation.count(:book_id, :group => :user_id)
  end
  def delete_members
    del_user = User.where(id: params[:to_be_deleted_members])
    del_user.update_all(isDeleted: TRUE)
    redirect_to action: 'view_members'
  end
end
