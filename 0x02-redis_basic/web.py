import redis
import requests
from functools import wraps

# Connect to Redis
cache = redis.Redis(host='localhost', port=6379, db=0)

def cache_decorator(expiration: int = 10):
    '''Decorator to cache the result of get_page function and set an expiration time'''
    def decorator(fn):
        @wraps(fn)
        def wrapper(url: str):
            # Check if the URL is already in the cache
            cached_content = cache.get(url)
            if cached_content:
                return cached_content.decode('utf-8')

            # If not cached, fetch the page
            content = fn(url)

            # Store the content in the cache with an expiration time
            cache.setex(url, expiration, content)

            return content
        return wrapper
    return decorator

def count_access(fn):
    '''Decorator to count how many times a URL was accessed'''
    @wraps(fn)
    def wrapper(url: str):
        # Increment the access count for the URL
        cache.incr(f"count:{url}")
        return fn(url)
    return wrapper

@cache_decorator(expiration=10)
@count_access
def get_page(url: str) -> str:
    '''Fetches the content of a URL and returns it as a string'''
    response = requests.get(url)
    return response.text

if __name__ == "__main__":
    url = "http://slowwly.robertomurray.co.uk/delay/5000/url/https://example.com"
    print(get_page(url))
    print(f"Access count: {cache.get(f'count:{url}').decode('utf-8')}")
