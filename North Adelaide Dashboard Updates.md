**Problem**: Usage statistics for 5 minutes shows greater than expected number
**Solution**: Add new function to db to generate a filtered unique count 

**Problem**: Usage statistics now says 5 minutes, when filtered for 1 in the function
**Solution**: Change panel to 1 mintue

**Problem**: Course visits by day of week panel shows decreased values for current day of week,
**Solution**: Change time span to observe values slightly greater than one week 

- filter out short trips for path analytics
	- hole 1 - 18 > 3 hours
	- hole 
- for par 3, check how many people walk past and compare to how many people stay
- add dwell times breakdown to dashboard
- people going through:
	- 1 - 9 - 18
	- 1 - 18 - clubhouse
- devices registered once / twice / etc.
- add device analytics panels
- change path to straight line
- use counts where possible





functions to have BT filtering
- filtered unique
-  park count (>5min)
-  dwell buckets


functions to be added to cron
- sage_aggregatepark_count_notbt
- sage_aggregatepark_count_short_notbt
- sage_aggregatevisitors_dwell_buckets_nobt
- sage_aggregatevisitors_park_count_notbt


