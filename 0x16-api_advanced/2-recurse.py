#!/usr/bin/python3
"""returns a list containing the titles of all
    hot articles for a given subreddit
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """Recursively queries the Reddit API and returns a
        list of titles for all hot articles in a subreddit.
    """

    # Set the API endpoint URL and headers
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}

    # Add the 'after' parameter to the URL if it exists
    if after:
        url += f"?after={after}"

        # Send a GET request to the API endpoint
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Check if the request was successful and the response is valid JSON
    if response.status_code == 200:
        data = response.json()

        # Add the titles of all hot articles to the hot_list
        for post in data["data"]["children"]:
            hot_list.append(post["data"]["title"])

        # Recursively call the function with the next 'after'
        if data["data"]["after"]:
            recurse(subreddit, hot_list, data["data"]["after"])

            return hot_list
        else:
            return None
