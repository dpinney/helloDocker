from flask import Flask, render_template, request, redirect
from flask_basicauth import BasicAuth
from datetime import datetime
import sys, time, threading

# Redirect Flask's request logging to file.
sys.stderr = open('log.txt', 'a')

# Let's have a database file, and create a new blank one on launch if it doesn't exist.
DATABASE = 'database.txt'
open(DATABASE, 'a').close()

app = Flask(__name__)

# HACK: Secrets for auth!
app.config['BASIC_AUTH_USERNAME'] = 'john'
app.config['BASIC_AUTH_PASSWORD'] = 'matrix'

basic_auth = BasicAuth(app)

@app.route('/')
def home():
	with open(DATABASE,'r') as db:
		lines = db.readlines()
	return '<pre>Welcome to monitorliz.\n\nDatabase:\n' + ''.join(lines) + '</pre>'

@app.route('/logs')
@basic_auth.required
def logs():
	return '<pre>' + open('log.txt','r').read() + '</pre>'

def workFun():
	while True:
		with open('database.txt','a') as db:
			db.write('Worker woke up. It is ' + str(datetime.now()) + '\n')
		time.sleep(10)

if __name__ == '__main__':
	worker = threading.Thread(target=workFun)
	worker.start()
	app.run(debug=True, host='0.0.0.0', threaded=True, use_reloader=False)
