# LibSys
<title>CSC 517 - Project 1</title>
<h2>LibSys - A Library management app</h2>
The application has
<ul>
<li>Pre configured admin with email: superUser@libsys.com password: Password12</li>
<li>Pre configured library members and a set of books</li>
<li>Some books have been issued to some library members</li>
</ul>
<h3>Basic Flow</h3>
<ul>
<li><p><b>Login:</b> Sign in using your email and passowrd and choose the role you want to be logged in. A new user can sign up as a member. Admin has to be created by an existing admin</p></li>
<li><b>Landing page:</b> It lists the functionalities available to the looged in user according to his role</li>
<li><b>Manage Member:</b><br/>
<p>Test that an admin is able to view and delete a member. Admin can view profile details of a member and promote him to admin. Admin can also view the checkout history of any member, or return a book on hi behalf</p></li>
<li><b>Manage Admin:</b><br/>
<p>Test that an admin is able to view and delete other admins. But he can not delete SuperUser or himself</p></li>
<br/>
<b>Note: </b>If a user has dual roles (both member and admin) deletion will just remove one role. If he has a single role then the user will be deleted. Also, if a member has a current reservation then admin will not be able to delete him unless the book is returned.
</ul>
