# LibSys - A Library management app
<title>CSC 517 - Project 1</title>

The application has
<ul>
<li>Pre configured admin with email: <b>superUser@libsys.com password: Password12</b></li>
<li>Pre configured library members and a set of books</li>
<li>Some books have been issued to some library members</li>
</ul>
<h3>Feature listing according to rubric</h3>
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
<li></li>
</ul>
<h3>Basic Flow</h3>
<ul>
<li><p><b>Login:</b> Sign in using your email and password and choose the role you want to be logged in with. A new user can sign up as a member. New admin has to be created by an existing admin</p></li>
<li><b>Landing page:</b> It lists the functionalities available to the logged in user according to his role</li>
<li><b>Manage Member:</b>
<p>Test that an admin is able to view and delete a member. Admin can view profile details of a member and promote him to admin. Admin can also view the checkout history of any member, or return a book on his behalf</p></li>
<li><b>Manage Admin:</b>
<p>Test that an admin is able to view and delete other admins. But he can not delete SuperUser or himself</p></li>
<b>Note: </b>If a user has dual roles (both member and admin) deletion will just remove one role. If he has a single role then the user will be deleted. Also, if a member has a current reservation then admin will not be able to delete him unless the book is returned.
<li><b>Manage Books:</b>
<p>Test that an admin is able to view the whole book catalogue, edit books, view checkout history of books, add and delete a book. He can also checkout a book on behalf of an existing member by providing his email id. A book can not be checked out if a user is only Admin. An admin can also suggest a book.</p></li>
<li><b>View Book Suggestions: </b>An admin can view all the book suggestions</li>
<li><b>Profile Details:</b> Allows both member and admin to update their profile details.</li>
<li><b>Books Catalogue:</b> This option is given to a member to checkout an available book</li>
</ul>
