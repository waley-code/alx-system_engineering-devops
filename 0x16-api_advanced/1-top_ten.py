#!/usr/bin/python3
"""prints the titles of the first 10 hot posts listed"""
import json
import requests
import sys


def top_ten(subreddit):
    """Prints the titles of the first 10 hot posts
        listed for a given subreddit.
    """

    # Set the API endpoint URL and headers
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"}

    # Send a GET request to the API endpoint
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Check if the reques was successful and the response is valid JSON
    if response.status_code == 200:
        data = response.json()
        # Loop through the first 10 posts and print their titles
        for post in data["data"]["children"][:10]:
            print(post["data"]["title"])
    else:
        print(None)
