from flask import Flask, jsonify

app = Flask(__name__)

# Route utama - halaman depan
@app.route('/')
def home():
    return "Selamat datang di Flask DevOps Project 1 🚀"

# Health check - penting untuk Kubernetes
@app.route('/health')
def health():
    return jsonify({"status": "healthy", "app": "devops-flask", "version": "1.0"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
