#!/usr/bin/env python3

"""
This module contains a single funct that lists all documents in NoSQL
collection
"""


def list_all(mongo_collection):
    """Lists all the documents in a collection."""

    if mongo_collection is None:
        return []

    return mongo_collection.find({})
