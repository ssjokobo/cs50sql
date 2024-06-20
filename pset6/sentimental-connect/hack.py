from cs50 import SQL


db = SQL("sqlite:///dont-panic.db")
pw = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    pw
)
