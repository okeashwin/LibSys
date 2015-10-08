# LibSys - A Library management app
<title>CSC 517 - Project 1</title><br>
The application is hosted here : http://ec2-54-165-120-164.compute-1.amazonaws.com:3000/ <br>
Following are the things that are already setup :
<ul>
<li>Pre configured admin with email: <b>superuser@libsys.com , password: Password12</b></li>
<li>Pre configured library members and a set of books</li>
<li>Some books have been issued to some library members</li>
</ul>
<h3>Feature listing</h3>
* <b>Admin: Basic:</b> An admin can login and update his/her profile details (email cannot be updated).<br/>Profile update is not allowed for superAdmin
* <b> Admin: Others:</b>
  * <b><u>Manage Admins</u></b>: 
    * Views the list of all admins. 
    * Delete them by checkbox selection. 
    * If one of the selected users has an active checkout, he/she will not be deleted. 
    * An admin can't delete himself/herself or the super admin.
  * <b><u>Manage Books</u></b>: 
    * Admin can add a new book, edit a book, view details and delete a book. 
    * A presently checked out book can not be deleted unless returned. 
    * On opening the "Book Details" view, admin gets the option of checking out the book and view the book's checkout history. 
    * The admin can checkout a book on behalf of any valid MEMBER (NOT ADMIN). Account should be associated to a member role for being allowed book checkout.<br/>
  * <b>Book Checkout history</b>: 
    * Lists the checkout history by date issued, date returned. 
    * The checkout history will display the member even if the member was deleted and is no longer an active member.       * For currently checked out books it provides admin an option to return the book on behalf of the member that borrowed it.
  * <b><u>Manage Members</u></b>: 
    * Displays a list of all library members with their profile details (except their passwords) and the number of their active checkouts. 
    * The same page provides deletion of a user through checkboxes. 
    * Member with active checkouts can not be deleted before the member has returned the book(s). 
    * Member can be promoted to an "admin" role by 'Make Admin' link.
    * Member checkout history: "Checkouts" is a link which takes admin to the checkout history of the member. History is displayed by date issued and date returned.If not returned it provides an option for admin to return on members behalf.
  * <b>View Book suggestions:</b> 
    * The admin can view current book suggestions by members and other admins. 
    * This view also lets admin to "approve" or "delete" a book suggestion. By approving the book suggestion, the book gets added to the library book catalogue. The admin can edit the book details during adding it to the catalogue.
  * <b>View Waitlist: </b> The admin can view current waitlist

* <b>Member Basic:</b> 
  * Anyone can signup to become a member. He is automatically logged in after singup.He can update his password and name (email update is not allowed).
* <b>Member Others: </b>
  * <b><u>Book Catalogue </u>:</b> 
    * This takes member to a view displaying all the books in the system. Clicking on view details provides him an option of checking out an available book or put himself on waitlist of a checked out book.
    * Catalogue also provides a search feature which takes him to a page where he can search a book on ISBN/title/author/status.
  * <b>Book suggestion</b>: 
    * Catalogue page also provides an option for a member to suggest any new books.
  * <b><u>View Checkout History</u>:</b> 
    * Member can view his/her checkout history with dates. For a currently checked-out book, the page provides an option to return.
  * <b><u>View suggestions</u></b>: 
    * Member can view the present suggestions before suggesting a new book through catalogue page. It is a read-only view to ensure that there are no duplicate book suggestions in the system.

<li>Extra Credit features</li>
<ul>
<li><b>Suggestions:</b> Member can make suggestions through book catalogue page while admin can do the same from manage books page. Both can also view a list of already suggested books by clicking on view suggestions on their homepages. For this functionality, the admin has higher privileges than the member in the way that an admin can "approve" or "delete" book suggestions whereas a library member cannot.</li>
<li><b>Waitlist:</b> If a book is checked out, a member can put himself on waitlist. Any number of members can be there on the waitlist. When a book is returned its waitlist is serviced. Book is checked out automatically to the member whose request came first and an email notification is sent to him. Other members remain on the waitlist and are serviced in the described order when the book is returned again </li>
</ul>
</ul>
