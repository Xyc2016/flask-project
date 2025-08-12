from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/api/greet")
def greet():
    return jsonify({"message": "Hello, rsbuild."})


if __name__ == "__main__":
    app.run(debug=True, port=8000)
