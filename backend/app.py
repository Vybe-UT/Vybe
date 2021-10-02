from flask import Flask, jsonify
import sqlite3

app = Flask(__name__)

USERS = 'backend/users.db'
# with sqlite3.connect(USERS) as db:
#     cursor = db.cursor()
#     cursor.execute('CREATE TABLE users (username TEXT, secret INTEGER)')
#     cursor.execute('INSERT INTO users VALUES ("admin", 0)')


@app.route('/')
def index():
    with sqlite3.connect(USERS) as db:
        cursor = db.cursor()
        secret = cursor.execute(
            'SELECT secret FROM users WHERE username = "admin"').fetchall()
        cursor.execute(
            'UPDATE users SET secret = ? WHERE username = "admin"', (secret[0][0] + 1,))
        return jsonify(secret)
