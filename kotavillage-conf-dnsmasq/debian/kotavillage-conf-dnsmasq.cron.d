# /etc/cron.d/kotavillage-conf-dnsmasq: crontab fragment for kotavillage-conf-dnsmasq
# This fetchs network settings from the database and restarts deamons if needed
# m h   dom mon dow     command

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#MAILTO=hotspot@kotavillage.tk
## NEEDS USERNAME
*/5 *   * * *   root    /usr/share/kotavillage/scripts/update_kotavillage_networksettings.sh
