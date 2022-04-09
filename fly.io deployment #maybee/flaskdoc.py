from flask import Flask, render_template, request, redirect
import sys

# Redirect Flask's request logging to file.
sys.stderr = open('./data/log.txt', 'a')

# Let's have a database file, and create a new blank one on launch if it doesn't exist.
DATABASE = 'database.txt'
open(DATABASE, 'a').close()

app = Flask(__name__)

@app.route('/')
def home():
	with open(DATABASE,'r') as db:
		lines = db.readlines()
	return render_template('./flaskdoc.html', lines=lines)

@app.route('/addMessage', methods=["POST"])
def addMessage():
	msg = request.form.get('msg')
	with open(DATABASE, 'a') as db:
		db.write(msg + '\n')
	#sys.stderr.write('User submitted ' + msg + '\n')
	return redirect('/')

# Password protect this?
@app.route('/logs')
def logs():
	return '<pre>' + open('./data/log.txt','r').read() + '</pre>'

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0')
