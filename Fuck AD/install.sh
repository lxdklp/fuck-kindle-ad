#!/bin/sh

rm -rf /mnt/us/system/.assets/* \
       /mnt/us/system/.mrch/* \
       /var/local/adunits/* \
       /var/local/merchant/*

sqlite3 /var/local/appreg.db <<'SQL'
UPDATE properties
   SET value='false'
 WHERE handlerid='dcc'
   AND name='dtcp_pref_ShowRecsPref';

DELETE FROM properties
 WHERE handlerid='dcc'
   AND name IN (
       'adunit.viewable',
       'dtcp_pref_ShowScreensaverPref',
       'dtcp_pref_ShowBannerPref'
   );
SQL

reboot