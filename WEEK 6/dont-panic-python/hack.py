# take SQL function from cs50 library
from cs50 import SQL

# make a connection with the database and python
# SQL (input)
# refer the database as db in my program
db = SQL ("sqlite:///dont-panic.db") #sqlite yazdığı için sqlite dialect kullanılacak

#take password from th user as an input
password = input("enter your password: ")

#execute function, write SQL query and the input
#because the password is input we use ? in the query
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """ ,
    password
)
