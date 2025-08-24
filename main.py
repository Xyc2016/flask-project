from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

metrics.info("fstack-be", "Backend of Fstack app", version="1.0.0")


@app.route("/api/greet")
def greet():
    return jsonify({"message": "Hello, rsbuild."})


if __name__ == "__main__":
    app.run(debug=True, port=8000)
