#!/bin/sh
sqlite3 .local/share/Anki2/Utilisateur\ 1/collection.anki2 -line 'SELECT count(*) FROM cards WHERE queue =0'|grep -o '[0-9]\+'
