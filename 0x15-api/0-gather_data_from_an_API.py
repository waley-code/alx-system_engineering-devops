#!/usr/bin/python3
""" Python script that, using this REST API,
    Given employee ID, returns information
    about his/her todo list progress.
"""
import requests
import sys


def funct():
    """Displays tasks based on id argument from scriot"""

    Id_us = 'https://jsonplaceholder.typicode.com/users/{}'.format(sys.argv[1])
    Id_td = 'https://jsonplaceholder.typicode.com/todos/?userId={}'\
            .format(sys.argv[1])
    user_name = requests.get(Id_us).json().get('name')
    request_todo = requests.get(Id_td).json()
    tasks = []
    for task in request_todo:
        if task.get('completed') is True:
            tasks.append(task.get('title'))

    print('Employee {} is done with tasks({}/{}):'.format(user_name,
                                                          len(tasks),
                                                          len(request_todo)))
    for task in tasks:
        print('\t {}'.format(task))


if __name__ == "__main__":
    if len(sys.argv) > 1:
        funct()
