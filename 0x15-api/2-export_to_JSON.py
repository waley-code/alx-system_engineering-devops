#!/usr/bin/python3
""" Python script that, using this REST API,
    Given employee ID, returns information
    about his/her todo list progress.
"""
import json
import requests
import sys


def funct():
    """Displays tasks based on id argument from scriot"""

    Id_us = 'https://jsonplaceholder.typicode.com/users/{}'\
            .format(sys.argv[1])
    Id_td = 'https://jsonplaceholder.typicode.com/todos/?userId={}'\
            .format(sys.argv[1])
    uId = sys.argv[1]
    user_name = requests.get(Id_us).json().get('username')
    req_todo = requests.get(Id_td).json()
    texts = []

    with open('{}.json'.format(sys.argv[1]), 'w+') as file:
        for todo in req_todo:
            text = {"task": todo.get("title"),
                    "completed": todo.get("completed"),
                    "username": user_name}
            texts.append(text)
        paxx = {uId: texts}
        file.write(json.dumps(paxx))


if __name__ == "__main__":
    if len(sys.argv) == 2:
        funct()
