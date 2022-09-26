#from urllib import request
from flask import Flask, request
from multiprocessing import Value

counter = Value('i', 0)
app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def hello():
    output = "Hello World!!!"
    if request.method == 'POST':
        with counter.get_lock():
            counter.value += 1
            output = '''<h1>The count value is: {}</h1>'''.format(counter.value)
    
    return output


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
