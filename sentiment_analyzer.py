from transformers import pipeline

# Initialize sentiment analysis pipeline
sentiment_pipeline = pipeline("sentiment-analysis")

def analyze_sentiment(articles):
    results = []
    for article in articles:
        sentiment = sentiment_pipeline(article['content'])[0]
        results.append({"title": article['title'], "sentiment": sentiment['label'], "score": sentiment['score']})
    return results
