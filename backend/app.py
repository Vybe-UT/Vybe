from flask import Flask, jsonify, render_template
from flask_socketio import SocketIO, emit
import sqlite3

app = Flask(__name__)
app.config['SECRET_KEY'] = 'arnsetiorsn'
socketio = SocketIO(app)

USERS = 'users.db'
# with sqlite3.connect(USERS) as db:
#     cursor = db.cursor()
#     cursor.execute('CREATE TABLE users (username TEXT, secret INTEGER)')
#     cursor.execute('INSERT INTO users VALUES ("admin", 0)')


@app.route('/')
def index():
    return render_template('test.html')
    with sqlite3.connect(USERS) as db:
        cursor = db.cursor()
        secret = cursor.execute(
            'SELECT secret FROM users WHERE username = "admin"').fetchall()
        cursor.execute(
            'UPDATE users SET secret = ? WHERE username = "admin"', (secret[0][0] + 1,))
        return jsonify(secret)


@socketio.on('upload')
def message(text):
    emit('download', text)


if __name__ == '__main__':
    socketio.run(app)
