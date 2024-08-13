#!/usr/bin/env python3

"""
This module contains a single funct that inserts a new document in a
collection based on the key-value pairs provided
"""


def insert_school(mongo_collection, **kwargs):
    """Inserts a new school into the collection and returns the id."""

    return mongo_collection.insert_one(kwargs).inserted_id
