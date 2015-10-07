# LibSys - A Library management app
<title>CSC 517 - Project 1</title>

The application has
<ul>
<li>Pre configured admin with email: <b>superUser@libsys.com password: Password12</b></li>
<li>Pre configured library members and a set of books</li>
<li>Some books have been issued to some library members</li>
</ul>
<h3>Feature listing </h3>
<h6>Please go through the list before starting your review and save yourself some time!</h6>
<ul>
<li><b>Admin: Basic:</b> An admin can login and update his/her profile details (email cannot be updated).<br/>Note: For the convenience of all reviewers profile update is not allowed for superAdmin</li>
<li><b>Admin: Others:</b> 
<ul>
<li><u>Manage Admins</u>: Can view the list of all admins. Delete them by checkbox selection. If one of the selected users have a current checkout, he will not be deleted and a message for the same will be displayed. He can't delete himself or super admin. Doing this will display an error message</li>
<li><u>Manage Books</u>: Admin can add a new book, edit a book, view details and delete a book. A presently checked out book can not be deleted unless returned. On opening the "Book Details" view, admin gets the option of checking out the book and view the book's checkout history. The admin can checkout a book on behalf of any valid MEMBER (NOT ADMIN). Account should be associated to a member role for being allowed book checkout. He can also suggest a book maybe on popular demand<br/>
<i>Book Checkout history</i>: The button is available with book details. Lists the checkout history by date issued, date returned. The checkout history will display the member even if the member was deleted and is no longer an active member. For currently checked out books it provides admin an option to return the book on behalf of the member that borrowed it. </li>
<li><u>Manage Members</u>: Displays a list of all library members with their profile details (except their passwords) and the number of their current checkouts. The same page provides deletion of a user through checkboxes. Member with active checkouts can not be deleted before the member has returned the book(s). Member can be promoted to an "admin" role by 'Make Admin' link.</br>
Member checkout history: "Checkouts" is a link which takes admin to the checkout history page of the member. History is displayed by date issued and date returned.If not returned it provides an option for admin to return on members behalf.</li>
<li>View Book suggestion: The admin can view current book suggestions by members and other admins. This view also lets admin to "approve" or "delete" a book suggestion. By approving the book suggestion, the book gets added to the library book catalogue. The admin can edit the book details during adding it to the catalogue. Once the book is about to get into the catalog, we must ensure that the book has valid non-empty values for ISBN, Book Name and Book authors. As far as book suggestions are concerned, the system requires valid non-empty values for Book Name and Book authors.</li>
<li>View Waitlist: The admin can view current waitlist</li>
</ul>
</li>
<li><b>Member Basic:</b> Anyone can signup to become a member. He is automatically logged in after singup.He can update his password and name (email update is not allowed).</li>
<li><b>Member Others: </b>
<ul>
<li><u>Book Catalogue</u>: This takes member to a view displaying all the books in the system. Clicking on view details provides him an option of checking out an available book or put himself on waitlist of a checked out book. <br/>
Catalogue also has a button to search which takes him to a page where he can search a boon on ISBN/title/author/status. <br/>
<i>Book suggestion</i>: Catalogue page also provides an option for a member to suggest any new books.</li>
<li><u>View Checkout History</u>: Member has an option on his homepage from where he can view his checkout history with dates. For a currently checked-out book, the page provides an option to return</li>
<li><u>View suggestions</u>: this view is provided on member home page. He can view the present suggestions before suggesting a new book through catalogue page. It is a read-only view to ensure that there are no duplicate book suggestions in the system.</li>
</ul>
</li>
<li>Extra Credit features</li>
<ul>
<li>Suggestions: Member can make suggestions through book catalogue page while admin can do the same from manage books page. Both can also view a  list of already suggested books by clicking on view suggestions on their homepages. For this functionality, the admin has higher privileges than the member in the way that an admin can "approve" or "delete" book suggestions whereas a library member cannot.</li>
<li>Waitlist: If a book is checked out, a member can put himself on waitlist. Any number of members can be there on the waitlist. When a book is returned its waitlist is serviced. Book is checked out automatically to the member whose request came first and an email notification is sent to him. Other members remain on the waitlist and are serviced in the described order when the book is returned again </li>
</ul>
</ul>
