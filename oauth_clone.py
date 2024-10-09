#!/usr/bin/python3
import os
import sys
import subprocess

user_args = sys.argv[1:]

with open("apitoken.txt", "r") as file:
    token = file.read().replace("\n", "")

repo = sys.argv[1].replace("https://", "")
args = " " + " ".join(sys.argv[2:])
url = f"https://oauth2:{token}@{repo}"

print(f"synthesized url={url}")

subprocess.run(["git", "clone", url])
