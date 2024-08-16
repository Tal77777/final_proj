from flask import Flask, render_template, request
from news_fetcher import fetch_news

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_news', methods=['POST'])
def get_news():
    stock_symbol = request.form['stock_symbol']
    articles = fetch_news(stock_symbol)
    return render_template('news.html', articles=articles)

if __name__ == '__main__':
    app.run(debug=True)
