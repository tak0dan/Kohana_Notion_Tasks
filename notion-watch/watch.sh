#!/usr/bin/env bash
# Polls Liza's public Notion task list (+ every task subpage); desktop notification on any change.
S="$HOME/.cache/notion-watch"; mkdir -p "$S/prof"
MAIN=40d515cd23cf80cc82d5dd69cf057f75
URL="https://app.notion.com/p/$MAIN?v=40d515cd23cf8050950d000c0a55aa21"
dump() { timeout 90 google-chrome-stable --headless=new --disable-gpu --user-data-dir="$S/prof" \
  --virtual-time-budget=20000 --dump-dom "$1" 2>/dev/null; }
text() { python3 -I -c "
import re,html,sys
t=sys.stdin.read()
t=re.sub(r'<(script|style)[^>]*>.*?</\1>','',t,flags=re.S)
t=html.unescape(re.sub(r'<[^>]+>','\n',t))
print('\n'.join(l.strip() for l in t.splitlines() if l.strip()))"; }
dump "$URL" > "$S/main.html"
[ -s "$S/main.html" ] || exit 1
text < "$S/main.html" > "$S/all.new"
for id in $(grep -o 'data-block-id="[0-9a-f-]*"' "$S/main.html" | cut -d'"' -f2 | sort -u | tr -d -); do
  [ "$id" = "$MAIN" ] && continue
  echo "### $id" >> "$S/all.new"; dump "https://app.notion.com/p/$id" | text >> "$S/all.new"
done
if [ -f "$S/all.old" ] && ! diff -q "$S/all.old" "$S/all.new" >/dev/null; then
  diff "$S/all.old" "$S/all.new" | grep '^[<>]' | head -20 > "$S/last.diff"
  notify-send -u critical "Liza's Notion changed" "$(grep '^>' "$S/last.diff" | head -5 | cut -c1-120)"
fi
mv "$S/all.new" "$S/all.old"
