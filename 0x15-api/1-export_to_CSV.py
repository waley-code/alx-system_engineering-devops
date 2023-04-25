#!/usr/bin/python3
""" Python script that, using this REST API,
    Given employee ID, returns information
    about his/her todo list progress.
"""
import csv
import requests
import sys


def funct():
    """Displays tasks based on id argument from scriot"""

    Id_us = 'https://jsonplaceholder.typicode.com/users/{}'\
            .format(sys.argv[1])
    Id_td = 'https://jsonplaceholder.typicode.com/todos/?userId={}'\
            .format(sys.argv[1])
    user_name = requests.get(Id_us).json().get('username')
    req_todo = requests.get(Id_td).json()
    tasks = []
    for task in req_todo:
        if task.get('completed') is True:
            tasks.append(task.get('title'))

    with open('{}.csv'.format(sys.argv[1]), 'w+') as file:
        for todo in req_todo:
            text = '"{}","{}","{}","{}"\n'.format(
                sys.argv[1], user_name, todo.get('completed'),
                todo.get('title'))
            file.write(text)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        funct()
