from bottle import *
import urllib.request, json, os

with urllib.request.urlopen("http://apis.is/petrol") as url:
    data = json.loads(url.read().decode())

@route('/static/<img>')
def img(img):
    return static_file(img, root='./')

@route('/')
def index():
    return template('index',data=data)

@route('/company/<company>')
def index(company):
    return template('company',data=data,c=company)

@route('/moreinfo/<key>')
def index(key):
    return template('moreinfo',data=data,k=key)

run(host="0.0.0.0", port=os.environ.get('PORT'))
#run(debug=True)
