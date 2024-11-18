import sys
from io import StringIO

def mapper():
    for line in sys.stdin:
        data = line.strip().split(";")
        if len(data) != 8:
            continue

        username, tweet_content, date_written, likes, retweets, replies, location, source = data

        for word in tweet_content.split():
            if word.startswith("#"):
                print "{0}\t{1}".format(word, 1)

def main():
    mapper()

if __name__ == "__main__":
    main()

