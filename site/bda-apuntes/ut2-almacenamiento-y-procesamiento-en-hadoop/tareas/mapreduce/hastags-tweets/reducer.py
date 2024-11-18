import sys

salesTotals = {}

for line in sys.stdin:
    data = line.strip().split("\t")
    if len(data) != 2:
        continue

    thisKey, thisSale = data
    if thisKey in salesTotals:
        salesTotals[thisKey] += float(thisSale)
    else:
        salesTotals[thisKey] = float(thisSale)

for key in salesTotals:
    print key, "\t", salesTotals[key]
