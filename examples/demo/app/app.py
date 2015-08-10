import os
from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def index():
    return 'This Flask app is dockerized. Explore the data to find out about cats!'


@app.route('/data')
def cats():
    data = {
        "cats": ["Maine Coon", "Bengal", "British Shorthair",
                   "Ragdoll", "Scottish Fold", "Absyssinian", "Siamese", "Sphynx"]
    }
    return jsonify(data)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 80))
    app.run(host='0.0.0.0', port=port)
