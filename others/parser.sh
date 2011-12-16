#/bin/sh

function PRINT {
  echo "$1" >> tmp
}

echo "processing $1"

if [ -f "tmp" ]; then
  rm tmp
fi

PRINT "---"
PRINT "title: '`cat $1 | sed -n 's/\[\[\!meta title="\(.*\)".*\]\]/\1/p'`'"
DATE=`cat $1 | sed -n 's/\[\[\!meta date="\(.*\)".*\]\]/\1/p' | dt_change.py`
PRINT "created: !!timestamp '$DATE'"
PRINT "guid: `cat $1 | sed -n 's/\[\[\!meta guid="\(.*\)".*\]\]/\1/p'`"
TAGS=`cat $1 | sed -ne 's/\[\[\!tag[ ]*\(.*\)[ ]*\]\]/\1/p'`
if [ -n "$TAGS" ]; then
  PRINT "tags:"
  for t in $TAGS
  do
    PRINT "    - $t"
  done
fi
PRINT "---"

cat $1 | grep -v "^\[\[" >> tmp

mv tmp $1
