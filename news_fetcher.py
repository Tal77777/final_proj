from yahooquery import search

def fetch_news(stock_symbol):
    """
    Fetches news articles related to the given stock symbol from Yahoo Finance.

    Args:
        stock_symbol (str): The stock symbol for which news is to be fetched.

    Returns:
        list: A list of dictionaries containing news articles.
    """
    # Fetch news using the yahooquery library
    result = search(stock_symbol)
    articles = result.get('news', [])
    
    # Debugging: Print fetched articles
    print("Fetched articles:", articles)
    
    # Format the news articles
    formatted_articles = [
        {
            "title": article.get('title', 'No Title Available'),
            "content": article.get('description', 'No Description Available')  # Adjusted field name
        }
        for article in articles
    ]
    
    return formatted_articles
