#!/usr/bin/env python3


"""
This module contains a function that returns the list of schools having a
specific topic
"""


def schools_by_topic(mongo_collection, topic):
    """It returns the schools offering a specified topic"""

    return mongo_collection.find({"topics": topic})
