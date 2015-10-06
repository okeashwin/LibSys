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
<li>Admin basic: An admin can login and update his profile details (email can not be updated).<br/>Note: For the convenience of all reviewrs profile update is not allowed for super user</li>
<li>Admin others: 
<ul>
<li>Manage Admins: Can view the list of all admins. Delete them by checkbox selection. If one of the selected users have a current checkout, he will not be deleted and a message for the same will be displayed. He can't delete himself or super admin. Doing this will display an error message</li>
<li>Manage Books: Admin can add a new book. Edit a book, view details and delete a book. A presently checked out book can not be deleted unless returned. On opening book details admin get option of checking out and view checkout history. He can checkout a book on behalf of any valid MEMBER (NOT ADMIN).Account should be associated to a member role for being allowed book checkout. He can also suggest a book maybe on popular demand<br/>
Book Checkout history: The button is available with book details. Lists the checkout history by date issued, date returned. will display user in history even if user was deleted and no longer an active member. For currently checked out books it provides admin an option to return on behalf of user </li>
<li>Manage Members: Displays a list of all library members their profile details (except password) and number of their CURRENT checkouts. The same page provides deletion of a user through checkboxes. Member with active checkouts can not be deleted before returning the book(s). Member can be promoted to an Amdin role by 'Make Admin' link.</br>
Member checkout history: Current checkout is a link which takes admin to the checkout history page of the admin. History is dispalyed by date issued and date returned.If not returned it provides an option for admin to return on members behalf.</li>
<li>View Book suggestion: He can view current book suggestions by members and other admins</li>
<li>View Waitlist: He can view current waitlist</li>
</ul>
</li>
<li>Member Basic: Anyone can signup to become a member. he is automatically logged in after singup.He can update his password and name (email update is not allowed).</li>
<li>Member Others:
<ul>
<li>Book Catalogue: This takes member to a view displaying all the books in the system. Clicking on view details provide him an option of checking out an available book or put himself on waitlist of a checked out book. <br/>
Catalogue also has a button to search which takes him to a page where he can search a boon on ISBN/title/author/status. <br/>
Book suggestion: Catalogue page also provides an option for a member to suggest any new books.</li>
<li>View Checkout History: Member ahs an optiona at his homepage from where he can view hsi checkout history with dates. For a current checkout the page provides an option to return</li>
<li>View suggestions: this option is provided on member home page. He can view the present suggestions before suggesting a new book through catalogue page</li>
</ul>
</li>
<li>Extra Credit features</li>
<ul>
<li>Suggestions: Member can make suggestions through book catalogue page while admin can do the same form manage books page. Both can also view a  list of already suggested books by clicking on view suggestions on their homepages</li>
<li>Waitlist: If a book is checked out, a member can put himself on waitlist. Any number of members can be there on the waitlist. When a book is returned its waitlist is serviced. Book is checked out automatically to the member whose request came first and an email notification is send to him. Other members remain on the waitlist and are serviced in the described order when the book is returned again </li>
</ul>
</ul>
