import hashlib

MAX_INT = (1<<31)-1


def djb2(string):
    hash = 5381

    for char in string:
        char = ord(char)
        print("char: {}".format(char))
        hash = ((hash << 5) + hash) + char
        print("hash: {}".format(hash))
        
    return hash % MAX_INT


def md5(string):
    return int("".join(map(str, hashlib.md5(string.encode("ASCII")).digest()))) % MAX_INT
