#!/usr/bin/python3
""" parses the title of all hot articles, and prints a sorted count"""
import requests


def count_words(subreddit, word_list, after=None, counts={}):
    """ prints a sorted count of given keywords
    """
    if after is None:
        counts = {}
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0'}
    params = {'limit': '100', 'after': after}
    response = requests.get(url, headers=headers,
                            params=params, allow_redirects=False)
    if response.status_code != 200:
        return None
    data = response.json()
    posts = data['data']['children']
    for post in posts:
        title = post['data']['title'].lower()
        words = title.split()
        for word in word_list:
            word = word.lower()
            if word in words:
                if word in counts:
                    counts[word] += words.count(word)
                else:
                    counts[word] = words.count(word)
    if data['data']['after'] is None:
        sorted_counts = sorted(counts.items(), key=lambda x: (-x[1], x[0]))
        for count in sorted_counts:
            print('{}: {}'.format(count[0], count[1]))
        else:
            count_words(subreddit, word_list, data['data']['after'], counts)
