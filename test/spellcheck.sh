#!/bin/sh

set -o pipefail

echo "--> spellcheck markdown files"
IGNORE_REGEX="[0-9a-f]{7} (?=.*[0-9])[0-9A-Za-z_\-]{11}" # GitHub hashes and YouTube IDs
IGNORE_FILES="!(content/tv/tgik/**/index.md) !(content/tv/talk/**/index.md)" # Don't worry about TGIK/Tanzu Talk episodes for now as they scrape from YT
spellchecker -q --no-suggestions -l en-US -f 'content/**/*.md' $IGNORE_FILES -i $IGNORE_REGEX --frontmatter-keys title Title description Description -d custom_dict.txt --plugins frontmatter spell syntax-urls indefinite-article repeated-words