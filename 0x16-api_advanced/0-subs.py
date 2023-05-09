#!/usr/bin/python3
"""returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers for a given subreddit."""

    # Set the API endpoint URL and headers
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}
    # Send a GET request to the API endpoint
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Check if the request was successful and the response is valid JSON
    if response.status_code == 200:
        data = response.json()
        return data["data"]["subscribers"]
    else:
        return 0
